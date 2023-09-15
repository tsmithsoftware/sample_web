--liquibase formatted sql
        
--changeset tsmith:1
create table person (  
    id int primary key,
    name varchar(255)  
);