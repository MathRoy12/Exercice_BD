CREATE TABLE Etudiants.Etudiant
(
    EtudiantID    int IDENTITY (1,1),
    Prenom        varchar(50) NOT NULL,
    Nom           varchar(50) NOT NULL,
    DateNaissance Date        NOT NULL,
    Classe        char(2)     NOT NULL,
    CONSTRAINT PK_Etudiant_EtudiantID PRIMARY KEY (EtudiantID)
);
GO

CREATE TABLE Fruits.Fruit
(
    FruitID int IDENTITY (1,1),
    Nom     varchar(30) NOT NULL,
    Couleur varchar(30) NOT NULL,
    CONSTRAINT PK_Fruit_FruitID PRIMARY KEY (FruitID)
);
GO

CREATE TABLE Fruits.EtudiantFruit
(
    EtudiantFruitID int IDENTITY (1,1),
    EtudiantID      int NOT NULL,
    FruitID         int NOT NULL,
    CONSTRAINT PK_EtudiantFruit_EtudiantFruitID PRIMARY KEY (EtudiantFruitID)
);
GO

ALTER TABLE Fruits.EtudiantFruit
    ADD CONSTRAINT FK_EtudiantFruit_FruitID
        FOREIGN KEY (FruitID) REFERENCES Fruits.Fruit (FruitID)
            ON DELETE CASCADE;
GO

ALTER TABLE Fruits.EtudiantFruit
    ADD CONSTRAINT FK_EtudiantFruit_EtudiantID
        FOREIGN KEY (EtudiantID) REFERENCES Etudiants.Etudiant (EtudiantID)
            ON DELETE CASCADE;
GO