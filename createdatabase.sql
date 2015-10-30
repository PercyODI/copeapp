SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS scout;
CREATE TABLE scout (
    scoutid serial PRIMARY KEY,
    fname varchar(35) NOT NULL,
    lname varchar(35),
    copename varchar(50) NOT NULL
) ENGINE = INNODB;

DROP TABLE IF EXISTS cope_group;
CREATE TABLE cope_group (
    groupid serial PRIMARY KEY,
    camp varchar(255),
    dateformed DATE,
    lastmodified DATE,
    copename varchar(50) NOT NULL
) ENGINE = INNODB;

DROP TABLE IF EXISTS group_stats;
CREATE TABLE group_stats (
    groupid BIGINT UNSIGNED,
    communication TINYINT DEFAULT 50,
    planning TINYINT DEFAULT 50,
    trust TINYINT DEFAULT 50,
    teamwork TINYINT DEFAULT 50,
    leadership TINYINT DEFAULT 50,
    decisionmaking TINYINT DEFAULT 50,
    problemsolving TINYINT DEFAULT 50,
    selfesteem TINYINT DEFAULT 50
) ENGINE = INNODB;

DROP TABLE IF EXISTS instructor;
CREATE TABLE instructor (
    instructorid serial PRIMARY KEY,
    fname varchar(35),
    lname varchar(35),
    copename varchar(50)
) ENGINE = INNODB;

DROP TABLE IF EXISTS game;
CREATE TABLE game (
    gameid serial PRIMARY KEY,
    title VARCHAR(50),
    description TEXT,
    createdby BIGINT UNSIGNED,
    CONSTRAINT FOREIGN KEY (createdby) REFERENCES instructor(instructorid)
) ENGINE = INNODB;

DROP TABLE IF EXISTS game_type;
CREATE TABLE game_type (
    typeid serial PRIMARY KEY,
    keyword VARCHAR(25)
) ENGINE = INNODB;

DROP TABLE IF EXISTS game_tag;
CREATE TABLE game_tag (
    tagid serial PRIMARY KEY,
    keyword VARCHAR(25)
) ENGINE = INNODB;

DROP TABLE IF EXISTS group_game_queue;
CREATE TABLE group_game_queue (
    groupid BIGINT UNSIGNED,
    gameid BIGINT UNSIGNED,
    index SMALLINT UNSIGNED,
    CONSTRAINT FOREIGN KEY (groupid) REFERENCES cope_group(groupid),
    CONSTRAINT FOREIGN KEY (gameid) REFERENCES game(gameid),
    PRIMARY KEY (groupid, gameid)
) ENGINE = INNODB;
    

DROP TABLE IF EXISTS scouts_groups;
CREATE TABLE scouts_groups (
    scoutid BIGINT UNSIGNED,
    groupid BIGINT UNSIGNED,
    CONSTRAINT FOREIGN KEY (scoutid) REFERENCES scout(scoutid),
    CONSTRAINT FOREIGN KEY (groupid) REFERENCES cope_group(groupid),
    PRIMARY KEY (scoutid, groupid)
) ENGINE = INNODB;

DROP TABLE IF EXISTS groups_instructors;
CREATE TABLE groups_instructors (
    groupid BIGINT UNSIGNED,
    instructorid BIGINT UNSIGNED,
    CONSTRAINT FOREIGN KEY (groupid) REFERENCES cope_group(groupid),
    CONSTRAINT FOREIGN KEY (instructorid) REFERENCES instructor(instructorid),
    PRIMARY KEY (groupid, instructorid)
) ENGINE = INNODB;

DROP TABLE IF EXISTS scout_played_games;
CREATE TABLE scout_played_games (
    scoutid BIGINT UNSIGNED,
    gameid BIGINT UNSIGNED,
    dateplayed DATE,
    CONSTRAINT FOREIGN KEY (scoutid) REFERENCES scout(scoutid),
    CONSTRAINT FOREIGN KEY (gameid) REFERENCES game(gameid),
    PRIMARY KEY (scoutid, gameid)
) ENGINE = INNODB;

DROP TABLE IF EXISTS groups_games;
CREATE TABLE groups_games (
    groupid BIGINT UNSIGNED,
    gameid BIGINT UNSIGNED,
    dateplayed DATE,
    CONSTRAINT FOREIGN KEY (groupid) REFERENCES cope_group(groupid),
    CONSTRAINT FOREIGN KEY (gameid) REFERENCES game(gameid),
    PRIMARY KEY (groupid, gameid)
) ENGINE = INNODB;

DROP TABLE IF EXISTS games_types;
CREATE TABLE games_types (
    typeid BIGINT UNSIGNED,
    gameid BIGINT UNSIGNED,
    CONSTRAINT FOREIGN KEY (typeid) REFERENCES game_type(typeid),
    CONSTRAINT FOREIGN KEY (gameid) REFERENCES game(gameid),
    PRIMARY KEY (typeid, gameid)
) ENGINE = INNODB;

DROP TABLE IF EXISTS games_tags;
CREATE TABLE games_tags (
    tagid BIGINT UNSIGNED,
    gameid BIGINT UNSIGNED,
    CONSTRAINT FOREIGN KEY (tagid) REFERENCES game_tag(tagid),
    CONSTRAINT FOREIGN KEY (gameid) REFERENCES game(gameid),
    PRIMARY KEY (tagid, gameid)
) ENGINE = INNODB;

SET FOREIGN_KEY_CHECKS=1;

INSERT INTO scout (fname, lname, copename) VALUES ("John", "Smith", "Redhands");

INSERT INTO cope_group (camp, copename, dateformed, lastmodified) VALUES ("Camp Hohn", "Big Wigs", now(), now());

-- Set default stats for Big Wigs
INSERT INTO group_stats (groupid) VALUES (1);

INSERT INTO instructor (fname, lname, copename) VALUES ("Pearse", "Hutson", "Precious");

INSERT INTO game (title, description, createdby) VALUES ("King of the Jungle", "A king of the jungle is appointed. Everyone must name a correspondingly smaller animal, along with the noise the animal makes. If someone messes-up they go to the bottom of the food chain.", 1);
INSERT INTO game (title, description, createdby) VALUES ("If I Were... I Would...", "Each person writes two statements: \"If I were...\" and \"I would...\" These statements are collected in two separate hats. The \"I would\" hat and the \"If I were\" hat. Everyone picks one from each hat and reads them.", 1);
INSERT INTO game (title, description, createdby) VALUES ("Romantic Encounter", "Everyone sits in a circle on a chair. Everyone draws from a hat to get the action they must do. The leader reads the story and whenever the person\'s key word is said, they must do the assigned action. The action and the story can be very creative and custom made for the age group.", 1);
INSERT INTO game (title, description, createdby) VALUES ("Doodling in a Winter Wonderland", "Same as Win Lose or Draw. The group is divided into two teams. First team selects a person from the group to be the first drawer. The drawer is shown a topic and must draw pictures so that his team can guess what the topic is. The team only has one and a half minutes to guess. After the time is gone and the team still has not guessed correct, the opposition gets one guess to steel the point. The winning team is the team with the most points at the end of play. In this case, a Christmas theme was used, but any theme will work.", 1);
INSERT INTO game (title, description, createdby) VALUES ("Blanket Name Game", "The group is divided into two teams. Two people not on a team must hold up a side of the blanket. One person from each team approaches to blanket. When the blanket is dropped, the person to call the other by their correct name wins. The slower person switches teams. The game is won when one member is left on a team.", 1);
INSERT INTO game (title, description, createdby) VALUES ("Do the Socky Wocky", "Standing in a circle with your socks rolled up in the center, sing the song \"Do the hoky poky\" switching to the \"socky wocky\" Follow the instructions and grab and wave your socks during the \"socky wocky.\"", 1);
INSERT INTO game (title, description, createdby) VALUES ("Four Way Tug of War", "Divide into four teams. Each team grabs a length of rope. On the command \"GO\" everyone starts to pull. The team that gets pulled across the center loses. The interesting aspect of this game occurs usually just after the start. Teams will work together to get another team across the center. Often a three against one situation develops.", 1);
INSERT INTO game (title, description, createdby) VALUES ("So You Read the Newspaper Eh?", "Divide into groups of five or six. Each group is given an exact same newspaper and two minutes to memorize the front cover of each section. A question is given and the first person to put on a coat, pour water into the wine glass, hold the cigar and make the wine glass ring by rubbing the rim can answer. Team with the most right answers wins.", 1);

INSERT INTO game_type (keyword) VALUES ("communication");
INSERT INTO game_type (keyword) VALUES ("planning");
INSERT INTO game_type (keyword) VALUES ("trust");
INSERT INTO game_type (keyword) VALUES ("teamwork");
INSERT INTO game_type (keyword) VALUES ("leadership");
INSERT INTO game_type (keyword) VALUES ("decisionmaking");
INSERT INTO game_type (keyword) VALUES ("problemsolving");
INSERT INTO game_type (keyword) VALUES ("selfesteem");

INSERT INTO game_tag (keyword) VALUES ("icebreaker");

-- John Smith in Big Wigs group
INSERT INTO scouts_groups (scoutid, groupid) VALUES (1, 1);

-- Pearse Hutson instructor of Big Wigs
INSERT INTO groups_instructors (groupid, instructorid) VALUES (1, 1);

-- John Smith has played King of the Jungle
INSERT INTO scout_played_games (scoutid, gameid, dateplayed) VALUES (1, 1, now());

-- Big Wigs have played King of the Jungle
INSERT INTO groups_games (gameid, groupid, dateplayed) VALUES (1, 1, now());

-- King of the Jungle has tag icebreaker
INSERT INTO games_tags (tagid, gameid) VALUES (1, 1);

-- King of the Jungle has type teamwork
INSERT INTO games_types (gameid, typeid) VALUES (1, 4);

