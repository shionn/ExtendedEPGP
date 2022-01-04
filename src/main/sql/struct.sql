CREATE TABLE player (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL UNIQUE,
  class varchar(16) NOT NULL,
  PRIMARY KEY (id)
) DEFAULT CHARACTER SET=utf8;

CREATE TABLE item (
  id int(11) NOT NULL,
  name varchar(64) NOT NULL UNIQUE,
  raid varchar(32) NOT NULL,
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
