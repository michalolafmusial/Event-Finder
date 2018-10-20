CREATE SCHEMA IF NOT EXISTS niebiescy;

USE niebiescy;

CREATE TABLE IF NOT EXISTS users
(
    id_user int NOT NULL AUTO_INCREMENT,
    login varchar(30) NOT NULL unique ,
    password varchar(255) NOT NULL,
    name varchar(100) NOT NULL,
    surname varchar(100) NOT NULL,
    email varchar(360) NOT NULL,
    phone varchar(30),
    type VARCHAR(10) NOT NULL,
    isactive BOOLEAN DEFAULT 0 NOT NULL,
    CONSTRAINT PK_User PRIMARY KEY (id_user)
);

CREATE TABLE IF NOT EXISTS events
(
  id_event int NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  description VARCHAR(2000),
  start_date date NOT NULL,
  finish_date date NOT NULL,
  address varchar(1024) NOT NULL,
  googlemaps varchar(1024),
  organizer int not null,
  price double not null,
  tickets int not null,
  category VARCHAR(2000) not null,
  promote BOOLEAN DEFAULT 0 not null,
  image longblob,
  constraint PK_Event primary key (id_event)
);



commit;

select * from niebiescy.users order by id_user desc
select * from niebiescy.events




