--liquibase formatted sql
        
--changeset tsmith:1

create table users (
    id bigint generated always as identity primary key,
    firstName varchar(255),
    lastName varchar(255)
);

create table schedules (  
    id bigint generated always as identity primary key,
    scheduleName varchar(255),
    userId int
);

ALTER TABLE schedules ADD CONSTRAINT fk_schedule_user FOREIGN KEY (id) REFERENCES users(id) ON UPDATE RESTRICT ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;

create table events (  
    id bigint generated always as identity primary key,
    eventName varchar(255),
    scheduleId int
);

ALTER TABLE events ADD CONSTRAINT fk_event_schedule FOREIGN KEY (id) REFERENCES schedules(id) ON UPDATE RESTRICT ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;

insert into users (firstName, lastName) values ('tom', 'jones');

insert into schedules(scheduleName, userId) values ('schedule1', 1);

insert into events(eventName, scheduleId) values ('event1', 1);