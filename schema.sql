/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name varchar(100)
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL DEFAULT 0,
    neutered BOOLEAN NOT NULL DEFAULT FALSE,
    weight DECIMAL(6,2) NOT NULL DEFAULT 0.00
);