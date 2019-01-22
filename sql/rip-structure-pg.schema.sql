CREATE DATABASE rip
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE SCHEMA security
    AUTHORIZATION postgres;
CREATE SCHEMA master
    AUTHORIZATION postgres;
CREATE SCHEMA workflow
    AUTHORIZATION postgres;
CREATE SCHEMA pacs
    AUTHORIZATION postgres;