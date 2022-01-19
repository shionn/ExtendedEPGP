-- joueur
CREATE OR REPLACE VIEW player_last_loot AS
SELECT e.player, p.name, MAX(r.date) AS loot_date, l.attribution
FROM       raid        AS r
INNER JOIN raid_entry  AS e ON r.id = e.raid
INNER JOIN player_loot AS l ON r.id = l.raid   AND l.player = e.player
INNER JOIN player      AS p ON p.id = l.player
GROUP BY player, attribution;

CREATE OR REPLACE VIEW player_nb_raid_without_loot AS (
	SELECT e.player, 'wishList' AS attribution, count(e.raid) AS nb_raid, MAX(r.date) AS loot_date
	FROM       raid       AS r
	INNER JOIN raid_entry AS e ON e.raid = r.id
	WHERE r.date > (SELECT loot_date FROM player_last_loot AS pll WHERE pll.player = e.player AND pll.attribution = 'wishList')
	GROUP BY player
) UNION (
	SELECT e.player, 'primary' AS attribution, count(e.raid) AS nb_raid, MAX(r.date) AS loot_date
	FROM       raid       AS r
	INNER JOIN raid_entry AS e ON e.raid = r.id
	WHERE r.date > (SELECT loot_date FROM player_last_loot AS pll WHERE pll.player = e.player AND pll.attribution = 'primary')
	GROUP BY player
) UNION (
	SELECT e.player, 'secondary' AS attribution, count(e.raid) AS nb_raid, MAX(r.date) AS loot_date
	FROM       raid       AS r
	INNER JOIN raid_entry AS e ON e.raid = r.id
	WHERE r.date > (SELECT loot_date FROM player_last_loot AS pll WHERE pll.player = e.player AND pll.attribution = 'secondary')
	GROUP BY player
);


CREATE OR REPLACE VIEW player_nb_raid AS
SELECT  e.player, count(e.raid) AS nb_raid
FROM   raid_entry    AS e
GROUP BY player;


-- raid
CREATE OR REPLACE VIEW raid_size AS
SELECT r.id AS raid, count(e.player) AS size
FROM       raid       AS r
INNER JOIN raid_entry AS e ON r.id = e.raid AND e.bench IS false AND e.absent IS false
GROUP BY raid;

CREATE OR REPLACE VIEW raid_attendance AS
(
	SELECT p.id AS player, p.name, r.instance, 'always' AS period, SUM(1) AS attendance
	FROM player           AS p
	INNER JOIN raid_entry AS re ON p.id = re.player AND re.absent IS false
	INNER JOIN raid       AS r  ON r.id = re.raid
	GROUP BY player, instance
) UNION (
	SELECT p.id AS player, p.name, r.instance, 'day28' AS period, SUM(1) AS attendance
	FROM player           AS p
	INNER JOIN raid_entry AS re ON p.id = re.player AND re.absent IS false
	INNER JOIN raid       AS r  ON r.id = re.raid
	                     AND r.date >= DATE(DATE_SUB(NOW(), INTERVAL 28 DAY))
	GROUP BY player, instance
) UNION (
	SELECT p.id AS player, p.name, r.instance, 'day14' AS period, SUM(1) AS attendance
	FROM player           AS p
	INNER JOIN raid_entry AS re ON p.id = re.player AND re.absent IS false
	INNER JOIN raid       AS r  ON r.id = re.raid
	                     AND r.date >= DATE(DATE_SUB(NOW(), INTERVAL 14 DAY))
	GROUP BY player, instance
);

-- epgp --
CREATE OR REPLACE VIEW player_gp AS
SELECT p.id AS player, 
	p.name    AS player_name, 
	i.name    AS item_name,
	r.id      AS raid, 
	i.pt      AS initial_gp,
	ROUND(i.pt * POWER(0.9, DATEDIFF(CURDATE(),r.date) div 7)) AS gp,
  DATEDIFF(CURDATE(),r.date) div 7  AS week_ago
FROM       player      AS p
INNER JOIN player_loot AS pl ON p.id = pl.player 
                            AND (pl.attribution = 'primary' or pl.attribution = 'wishList')
INNER JOIN raid        AS r  ON r.id = pl.raid
INNER JOIN item        AS i  ON i.id = pl.item
GROUP BY player;

CREATE OR REPLACE VIEW raid_ep_simple AS
SELECT r.id AS raid, r.name, r.instance, r.date, rs.size,
  DATEDIFF(CURDATE(),r.date) div 7  AS week_ago,
  sum(gp.initial_gp)                AS initial_ep,
  sum(gp.gp)                        AS ep,
  sum(gp.initial_gp) div rs.size    AS initial_ep_per_player,
  sum(gp.gp)         div rs.size    AS ep_per_player
FROM raid AS r
INNER JOIN raid_size   AS rs ON r.id = rs.raid
LEFT  JOIN player_gp   AS gp ON r.id = gp.raid
GROUP BY raid;

CREATE OR REPLACE VIEW raid_ep_avg AS
SELECT instance, 
  ROUND(avg(initial_ep))            AS initial_ep, 
  ROUND(avg(ep))                    AS ep, 
  ROUND(avg(initial_ep_per_player)) AS initial_ep_per_player,
  ROUND(avg(ep_per_player))         AS ep_per_player
FROM raid_ep_simple 
GROUP BY instance;


CREATE OR REPLACE VIEW raid_ep AS
SELECT r.id AS raid, r.name, r.instance, r.date, rs.size, 
  DATEDIFF(CURDATE(),r.date) div 7  AS week_ago,
  e.initial_ep, e.ep, e.initial_ep_per_player, e.ep_per_player
FROM raid                   AS r
INNER JOIN raid_size        AS rs ON r.id       = rs.raid
INNER JOIN raid_ep_avg      AS e  ON r.instance = e.instance;

CREATE OR REPLACE VIEW player_ep AS
SELECT p.id AS player, p.name, 
	SUM( 
		CASE 
			WHEN re.absent IS true THEN -0.5 * ep.ep_per_player
			WHEN re.quit   IS true THEN  0.8 * ep.ep_per_player
			ELSE ep.ep_per_player 
		END) AS ep
FROM       player      AS p
INNER JOIN raid_entry  AS re ON p.id    = re.player
INNER JOIN raid_ep     AS ep ON re.raid = ep.raid
GROUP BY player;


CREATE OR REPLACE VIEW epgp AS
SELECT ep.player,
       ep.name,
       ep.ep,
       gp.gp,
       gp.gp / ep.ep AS epgp_ratio
FROM      player_ep AS ep
LEFT JOIN player_gp AS gp ON gp.player = ep.player;



