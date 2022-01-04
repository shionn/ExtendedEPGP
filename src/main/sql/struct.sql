CREATE TABLE player (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL UNIQUE,
  class varchar(16) NOT NULL,
  PRIMARY KEY (id)
) DEFAULT CHARACTER SET=utf8;

CREATE TABLE item (
  id int(11) NOT NULL,
  name varchar(64) NULL,
  raid varchar(32) NULL,
  boss varchar(64) NOT NULL,
  ilvl int(11) NOT NULL DEFAULT '0',
  slot varchar(32) DEFAULT NULL,
  pt int(11) DEFAULT '0',
  pt_ratio int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (id)
) DEFAULT CHARACTER SET=utf8;

CREATE TABLE item_assignment (
  item int(11) NOT NULL,
  class varchar(32) NOT NULL,
  PRIMARY KEY (class, item),
  FOREIGN KEY (item) REFERENCES item(id)
) DEFAULT CHARACTER SET=utf8;

CREATE TABLE raid (
  id        int(11)      NOT NULL AUTO_INCREMENT,
  name      varchar(128) NOT NULL,
  instance  varchar(8)   NOT NULL,
  date      datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  running   boolean      NOT NULL DEFAULT true,
  PRIMARY KEY (id)
) DEFAULT CHARACTER SET=utf8;
INSERT INTO raid (id,name,instance,running) values (0, 'Armory', 'Dungeon', false);

CREATE TABLE raid_entry (
  raid    int(11)    NOT NULL,
  player  int(11)    NOT NULL,
  bench   boolean    NOT NULL DEFAULT false,
  absent  boolean    NOT NULL DEFAULT false,
  PRIMARY KEY (raid, player),
  FOREIGN KEY (raid)   REFERENCES raid(id),
  FOREIGN KEY (player) REFERENCES player(id)
) DEFAULT CHARACTER SET=utf8;

CREATE TABLE player_loot (
  player       int(11)     NOT NULL,
  item         int(11)     NOT NULL,
  raid         int(11)     NULL,
  attribution  varchar(32) NOT NULL,
  PRIMARY KEY (player, item, raid),
  FOREIGN KEY (raid)   REFERENCES raid(id),
  FOREIGN KEY (player) REFERENCES player(id),
  FOREIGN KEY (item)   REFERENCES item(id)
) DEFAULT CHARACTER SET=utf8;


-- HELP
ALTER TABLE raid MODIFY COLUMN id int(11) NOT NULL AUTO_INCREMENT;
select * from information_schema.table_constraints where constraint_schema = 'epgp';
ALTER TABLE `table_name` DROP FOREIGN KEY 'toto';

