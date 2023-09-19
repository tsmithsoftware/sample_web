--liquibase formatted sql
        
--changeset tsmith:1

create table Users (
    id bigint generated always as identity primary key,
    firstName varchar(255),
    lastName varchar(255)
);

create table Schedules (  
    id bigint generated always as identity primary key,
    scheduleName varchar(255),
    userId int
);

ALTER TABLE Schedules ADD CONSTRAINT fk_schedule_user FOREIGN KEY (userId) REFERENCES Users(id) ON UPDATE RESTRICT ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;

create table Events (  
    id bigint generated always as identity primary key,
    eventName varchar(255),
    scheduleId int,
    startTime timestamp,
    endTime timestamp
);

ALTER TABLE Events ADD CONSTRAINT fk_event_schedule FOREIGN KEY (scheduleId) REFERENCES schedules(id) ON UPDATE RESTRICT ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;

insert into Users (firstName, lastName) values ('tom', 'jones');

insert into Schedules(scheduleName, userId) values ('schedule1', 1);

insert into Events(eventName, scheduleId, startTime, endTime) values ('event1', 1, '2023-09-18 12:00:00', '2023-09-18 13:00:00');

insert into Events(eventName, scheduleId, startTime, endTime) values ('event2', 1, '2023-09-18 14:00:00', '2023-09-18 15:00:00');