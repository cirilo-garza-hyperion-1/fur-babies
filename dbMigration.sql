USE furBabies_db;

DROP TABLE IF EXISTS Animal;
DROP TABLE IF EXISTS Medical_Records;
DROP TABLE IF EXISTS Dog_Breeds;
DROP TABLE IF EXISTS Cat_Breeds;
DROP TABLE IF EXISTS Adoption;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Veterinarian;
DROP TABLE IF EXISTS Clinic;

CREATE TABLE Users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email    VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Dog_Breeds
(
    id    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    breed VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE Cat_Breeds
(
    id    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    breed VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE Clinic
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE Veterinarian
(
    id        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name      VARCHAR(255),
    clinic_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (clinic_id) REFERENCES Clinic (id)
);

CREATE TABLE Medical_Records
(
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    vaccinations VARCHAR(255),
    surgeries    VARCHAR(255),
    veterinarian INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (veterinarian) REFERENCES Veterinarian (id)
);

CREATE TABLE Adoption
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    date    DATE,
    time    TIMESTAMP,
    user_id INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES Users (id)
);

CREATE TABLE Animal
(
    id             INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name           VARCHAR(240),
    age            INT UNSIGNED NOT NULL,
    gender         CHAR(1)      NOT NULL,
    dog_breed      INT UNSIGNED DEFAULT NULL,
    cat_breed      INT UNSIGNED DEFAULT NULL,
    medical_record INT UNSIGNED NOT NULL,
    description    VARCHAR(255),
    adoption_id    INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (dog_breed) REFERENCES Dog_Breeds (id)
        ON DELETE CASCADE,
    FOREIGN KEY (cat_breed) REFERENCES Cat_Breeds (id)
        ON DELETE CASCADE,
    FOREIGN KEY (medical_record) REFERENCES Medical_Records (id)
        ON DELETE CASCADE,
    FOREIGN KEY (adoption_id) REFERENCES Adoption (id)
        ON DELETE CASCADE
);