DROP DATABASE IF EXISTS local_zoo;

/* EXERCISE 1 - CHAPTER 1 */
CREATE DATABASE local_zoo;
USE local_zoo;
CREATE TABLE kinds(
	id INT,
    specie_name VARCHAR(50),
    habitat VARCHAR(50)
);
CREATE TABLE animals(
	id INT,
    animal_name VARCHAR(50),
    gender ENUM("male","female")
);

/* EXERCISE 2 - CHAPTER 1 */
INSERT INTO kinds(specie_name,habitat) VALUES
("Lion","Savana"),
("Cat","Feline"),
("Dog","Canine");

INSERT INTO animals(animal_name,gender) VALUES
("Apollo","Male");