USE R22_Billeterie
GO

-- CREATION DE LA TABLE AFFICHE (Rencontre 19)
CREATE TABLE Spectacles.Affiche
(
    AfficheID   int IDENTITY (1,1),
    Identifiant uniqueidentifier NOT NULL ROWGUIDCOL UNIQUE,
    SpectacleID int
        PRIMARY KEY (AfficheID)
)
GO
-- AJOUT du lien de clé étrangère
ALTER TABLE Spectacles.Affiche
    ADD CONSTRAINT FK_Affiche_SpectacleID
        FOREIGN KEY (SpectacleID)
            REFERENCES Spectacles.Spectacle (SpectacleID)
GO

-- finir table
ALTER TABLE Spectacles.Affiche
    ADD CONSTRAINT DF_Affiche_Identifiant DEFAULT NEWID() FOR Identifiant;
GO
ALTER TABLE Spectacles.Affiche ADD
        AfficheContent varbinary(max) FILESTREAM NULL;
GO

-- Insertion des images
INSERT INTO Spectacles.Affiche(SpectacleID, AfficheContent)
SELECT 1, BulkColumn
FROM OPENROWSET(
             BULK 'C:\Users\2234476\Desktop\Exercice_BD\WrapUpBilleterie\Affiches\LaMelodieDuBonheur.jfif',
             SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID, AfficheContent)
SELECT 2, BulkColumn
FROM OPENROWSET(
             BULK 'C:\Users\2234476\Desktop\Exercice_BD\WrapUpBilleterie\Affiches\Verdict.jfif',
             SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID, AfficheContent)
SELECT 3, BulkColumn
FROM OPENROWSET(
             BULK 'C:\Users\2234476\Desktop\Exercice_BD\WrapUpBilleterie\Affiches\AndreEtDorine.jfif',
             SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID, AfficheContent)
SELECT 4, BulkColumn
FROM OPENROWSET(
             BULK
             N'C:\Users\2234476\Desktop\Exercice_BD\WrapUpBilleterie\Affiches\LesDixCommandementsDeDorothéeDix.jfif',
             SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID, AfficheContent)
SELECT 5, BulkColumn
FROM OPENROWSET(
             BULK 'C:\Users\2234476\Desktop\Exercice_BD\WrapUpBilleterie\Affiches\LaMachineDeTuring.jfif',
             SINGLE_BLOB) AS myfile

