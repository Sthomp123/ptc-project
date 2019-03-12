/************************************************************/
/* Create the PTC Database                                  */
/* Steven Thompson                                          */
/* 3/11/2019                                                */
/************************************************************/
DROP DATABASE IF EXISTS PTC;


CREATE DATABASE PTC;

USE PTC;


CREATE TABLE District (
  district_id     TINYINT, 
  district_name   VARCHAR(16), 
  PRIMARY KEY(district_id));

INSERT INTO District VALUES (1, "St. Charles");
INSERT INTO District VALUES (2, "Orchard Farm");
INSERT INTO District VALUES (3, "Fort Zumwalt");
INSERT INTO District VALUES (4, "Francis Howell");
INSERT INTO District VALUES (5, "Lutheran");
INSERT INTO District VALUES (6, "Wentzville");
INSERT INTO District VALUES (7, "Christian");


CREATE TABLE School (
  school_id           TINYINT,
  school_name         VARCHAR(32),
  school_abbr         VARCHAR(3),
  school_district_id  TINYINT,
  PRIMARY KEY(school_id),
  FOREIGN KEY(school_district_id) REFERENCES District(district_id)
);

INSERT INTO School VALUES(1, "St. Charles High", "SCH", 1);
INSERT INTO School VALUES(2, "St. Charles West", "SCW", 1);
INSERT INTO School VALUES(3, "Orchard Farm", "OF", 2);
INSERT INTO School VALUES(4, "Fort Zumwalt North", "FZN", 3);
INSERT INTO School VALUES(5, "Fort Zumwalt South", "FZS", 3);
INSERT INTO School VALUES(6, "Fort Zumwalt East", "FZE", 3);
INSERT INTO School VALUES(7, "Fort Zumwalt West", "FZW", 3);
INSERT INTO School VALUES(8, "Wentzville Liberty", "WZL", 6);
INSERT INTO School VALUES(9, "Wentzville Holt", "WZH", 6);
INSERT INTO School VALUES(10, "Wentzville Timberland", "WZT", 6);
INSERT INTO School VALUES(11, "Francis Howell Central", "FHC", 4);
INSERT INTO School VALUES(12, "Francis Howell High", "FHH", 4);
INSERT INTO School VALUES(13, "Francis Howell North", "FHN", 4);
INSERT INTO School VALUES(14, "Christian High", "CH", 7);
INSERT INTO School VALUES(15, "Lutheran High", "LH", 5);


CREATE TABLE Staff (
  staff_id        TINYINT,
  staff_fname     VARCHAR(16),
  staff_lname     VARCHAR(20),
  staff_program   VARCHAR(4),
  staff_room      VARCHAR(10),
  /*staff_picture   LONGVARBINARY,*/
  staff_email     VARCHAR(32),
  staff_phone     VARCHAR(12),
  PRIMARY KEY(staff_id)
);

INSERT INTO Staff VALUES(1,"Thorin", "Schmidt", "CSD", "A107", 
                         "tschmidt@stcharlessd.org", "636-443-4987");
INSERT INTO Staff VALUES(2,"Robert", "Turner", "AST2", "A109", 
                         "roturnert@stcharlessd.org", "636-443-4982");
INSERT INTO Staff VALUES(3,"Glenn", "Seithel", "AST1", "A108", 
                         "gseithel@stcharlessd.org", "636-443-4978");
INSERT INTO Staff VALUES(4,"Sean", "Crader", "ACR", "A106", 
                         "scradert@stcharlessd.org", "636-443-4984");
INSERT INTO Staff VALUES(5, "Casey", "Lober", "COU", "C101",
                        "clober@stcharlessd.org", "636-443-4957");
INSERT INTO Staff VALUES(6, "Kristen", "Brent", "COU", "C103",
                        "kbrent@stcharlessd.org", "636-443-4965");
INSERT INTO Staff VALUES(7, "Carla", "Johnson", "RES", "B102",
                        "carjohnson@stcharlessd.org", "636-443-4971");
                         
                         
CREATE TABLE Student(
    student_id                  INTEGER,
    student_fname               varchar(16),
    student_lname               varchar(20),
    student_staff_id            TINYINT,
    /*tudent_picture            LONGVARBINARY,*/
    student_email               varchar(32),
    student_isresource          BOOlEAN,
    student_resource_staff_id   TINYINT,
    student_counselor_staff_id  TINYINT,
    student_home_school_id      TINYINT,
    PRIMARY KEY(student_id),
    FOREIGN KEY(student_staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY(student_resource_staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY(student_counselor_staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY(student_home_school_id) REFERENCES School(school_id)
);

    /* id, fname, lname, teacher, email, isresource, resoruce counselor, counselor, home school */
INSERT INTO Student VALUES(1, "John", "Smith", 1, "jsmith@stcharlessd.org", False, null, 5, 9);
INSERT INTO Student VALUES(2, "Jane", "Doe", 3, "jdoe@stcharlessd", True, 7, 6, 7);
INSERT INTO Student VALUES(3, "Gary", "Snail", 4, "gasnail@stcharlessd.org", False, null, 5, 11);
INSERT INTO Student VALUES(4, "Oswald", "Cobblepot", 1, "oswcobblepot@stcharlessd.org", True, 7, 6, 15);
INSERT INTO Student VALUES(5, "Obi Wan", "Kenobi", 2, "okenobi@stcharlessd.org", True, 7, 5, 2);
INSERT INTO Student VALUES(6, "Jar Jar", "Binks", 2, "jjbinks@stcharlessd.org", True, 7, 6, 10);
INSERT INTO Student VALUES(7, "Shaggy", "Rogers", 1, "srodgeres@stcharlessd.org", False, null, 5, 11);
INSERT INTO Student VALUES(8, "Squidward", "Tentacles", 4, "stentacles@stcharlessd.org", False, null, 6, 14);
INSERT INTO Student VALUES(9, "Squilliam", "Fancyson-Tentacles", 1, "sfancyson@stcharlessd.org", False, null, 5, 14);


