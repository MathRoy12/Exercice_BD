USE R22_Billeterie

-- Creation des tables Spectacle, Representation et Billet
CREATE TABLE Spectacles.Spectacle
(
    SpectacleID int IDENTITY (1,1),
    Nom         nvarchar(100) NOT NULL,
    Debut       date          NOT NULL,
    Fin         date          NOT NULL,
    Prix        int           NOT NULL
        PRIMARY KEY (SpectacleID)
)
GO

CREATE TABLE Spectacles.Representation
(
    RepresentationID        int IDENTITY (1,1),
    DateHeureRepresentation datetime NOT NULL,
    SpectacleID             int      NOT NULL
        PRIMARY KEY (RepresentationID)
)
GO

CREATE TABLE Spectacles.Billet
(
    BilletID         int IDENTITY (1,1),
    CoutBillet       int NULL,
    NbBillet         int NOT NULL,
    RepresentationID int NOT NULL,
    ClientID         int NOT NULL
        PRIMARY KEY (BilletID)
)
GO

-- Ajout des contraintes de clé étrangère
ALTER TABLE Spectacles.Representation
    ADD CONSTRAINT FK_Representation_SpectacleID
        FOREIGN KEY (SpectacleID)
            REFERENCES Spectacles.Spectacle (SpectacleID)
GO

ALTER TABLE Spectacles.Billet
    ADD CONSTRAINT FK_Billet_RepresentationID
        FOREIGN KEY (RepresentationID)
            REFERENCES Spectacles.Representation (RepresentationID)
GO

ALTER TABLE Spectacles.Billet
    ADD CONSTRAINT FK_Billet_ClientID
        FOREIGN KEY (ClientID)
            REFERENCES Clients.Client (ClientID)
GO

--- AUTRES CONTRAINTES ---
-- Par défault, la date de la représentation est la date du jour
ALTER TABLE Spectacles.Representation
    ADD CONSTRAINT DF_Representation_DateHeureRepresentation DEFAULT GETDATE() FOR DateHeureRepresentation
GO
--  Un check pour vérifier que le cout des billets est positif ou nul
ALTER TABLE Spectacles.Billet
    ADD CONSTRAINT CK_Billet_Cout CHECK (CoutBillet > 0 OR CoutBillet IS NULL)
GO

--  Unicité du nom du spectacles
ALTER TABLE Spectacles.Spectacle
    ADD CONSTRAINT UQ_Spectacle_Nom UNIQUE (Nom)
GO

-- LES INSERTIONS
-- Insertion des données
INSERT INTO Spectacles.Spectacle (Nom, Debut, Fin, Prix)
VALUES ('La mélodie du bonheur', '20230810', '20230818', 45),
       ('Verdict', '20230824', '20230825', 60),
       ('André et Dorine', '20230904', '20230905', 10),
       ('Les dix commandements de Dorothée Dix', '20230911', '20230912', 90),
       ('La Machine de Turing', '20230918', '20230919', 100)

INSERT INTO Spectacles.Representation
    (DateHeureRepresentation, SpectacleID)
VALUES ('20230810 20:00:00', 1),
       ('20230811 20:00:00', 1),
       ('20230817 20:00:00', 1),
       ('20230818 20:00:00', 1),
       ('20230824 20:00:00', 2),
       ('20230825 20:00:00', 2),
       ('20230904 20:00:00', 3),
       ('20230905 20:00:00', 3),
       ('20230911 20:00:00', 4),
       ('20230912 20:00:00', 4),
       ('20230918 20:00:00', 5),
       ('20230919 20:00:00', 5)

INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 4, 6, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 4, 10, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (69, 2, 4, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 2, 7, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 3, 5, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 3, 3, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 4, 5, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 3, 12, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 4, 2, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 4, 7, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 2, 8, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 3, 10, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 2, 11, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 4, 6, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 4, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 3, 7, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 4, 12, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 4, 8, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 4, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 3, 6, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 1, 10, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 4, 11, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 3, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 3, 3, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 1, 10, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (112, 1, 1, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 4, 9, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (77, 3, 10, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 4, 5, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 1, 1, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 3, 1, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 4, 5, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 2, 2, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 4, 6, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 2, 5, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 2, 4, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 3, 8, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 2, 10, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (112, 1, 9, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 3, 1, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 2, 9, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 3, 11, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 2, 4, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 3, 4, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 2, 10, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 1, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 1, 3, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 2, 2, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 3, 5, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 2, 2, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 1, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 2, 7, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 2, 10, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 4, 4, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (77, 2, 8, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 2, 11, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 4, 8, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 3, 9, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 4, 10, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 2, 7, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 3, 11, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 1, 7, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 3, 7, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 2, 7, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 4, 10, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (78, 2, 5, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 2, 12, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 4, 3, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 1, 9, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 2, 10, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 1, 12, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 1, 8, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 3, 9, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 2, 7, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 4, 7, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 3, 5, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 2, 5, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 3, 12, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 4, 8, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 2, 6, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 4, 11, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 1, 11, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 3, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 3, 4, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 4, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 3, 8, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 4, 2, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 4, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 2, 12, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 2, 11, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 4, 5, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 4, 2, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 3, 7, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 1, 10, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 3, 5, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 1, 12, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 1, 12, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 3, 11, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 4, 7, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 3, 9, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 4, 1, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 4, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 2, 2, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 4, 8, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 3, 12, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 1, 12, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 4, 6, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 4, 10, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 2, 9, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 4, 6, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 4, 1, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 3, 9, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 3, 4, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 4, 8, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 1, 3, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (77, 4, 4, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 1, 11, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 3, 1, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 1, 10, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 1, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 4, 7, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 3, 8, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 3, 11, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 1, 5, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 4, 7, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 3, 2, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 1, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 1, 5, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 2, 8, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 2, 5, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 4, 6, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 2, 7, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 1, 6, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 1, 12, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 3, 3, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 1, 3, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 4, 2, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 2, 9, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 2, 8, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 3, 3, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 3, 3, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 2, 9, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 2, 3, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 2, 3, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (78, 3, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 4, 9, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 4, 11, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 4, 9, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 3, 3, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 3, 7, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 1, 5, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 2, 5, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 3, 1, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 2, 11, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 1, 4, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 1, 5, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 4, 1, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 4, 4, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 2, 11, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 2, 6, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 2, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 2, 7, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 1, 2, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 4, 10, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 4, 9, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 1, 6, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 1, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 3, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 2, 3, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 1, 7, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 2, 12, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 1, 11, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 3, 2, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 1, 8, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 4, 10, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 1, 3, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 4, 5, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 3, 5, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 2, 8, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 4, 9, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 4, 6, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 2, 11, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 2, 2, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 3, 12, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 2, 5, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 3, 6, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 4, 11, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 4, 3, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 4, 1, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 4, 1, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 2, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 4, 2, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (94, 2, 5, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 4, 10, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 3, 12, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 3, 5, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 1, 11, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 4, 11, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 2, 6, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 2, 8, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 1, 11, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 2, 12, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 2, 3, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 1, 11, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 1, 11, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 2, 11, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 3, 3, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 1, 2, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 3, 6, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 1, 8, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 2, 1, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 4, 8, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 4, 2, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 3, 5, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 4, 7, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 1, 11, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 1, 8, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 1, 11, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 3, 7, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 3, 7, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 1, 8, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 1, 3, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 1, 8, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 3, 9, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 2, 8, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 2, 4, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 1, 2, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 1, 2, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 4, 2, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 3, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 3, 1, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 3, 12, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 1, 7, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 1, 1, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 2, 10, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 2, 5, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (94, 2, 1, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 1, 3, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 1, 2, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 1, 6, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 2, 3, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 2, 3, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 2, 5, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 3, 3, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 2, 4, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 4, 5, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 3, 3, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 2, 11, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 1, 11, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 3, 11, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 2, 10, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 4, 8, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 2, 5, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 2, 1, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 2, 10, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 1, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 1, 3, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 1, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 1, 3, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 2, 8, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 2, 11, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 2, 1, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 2, 3, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 4, 5, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 4, 12, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 1, 3, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 4, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 3, 12, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 3, 12, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 3, 3, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 2, 6, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 2, 8, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 1, 5, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 2, 11, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 4, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 3, 5, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 2, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 2, 6, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 4, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 3, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 2, 11, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 1, 12, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 1, 12, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 1, 3, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 3, 7, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 4, 1, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (77, 3, 6, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 4, 9, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 4, 7, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 1, 12, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 4, 4, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 4, 8, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 1, 3, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 4, 5, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 2, 2, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 3, 9, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 3, 7, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 1, 11, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 3, 7, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 1, 12, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (94, 2, 10, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 2, 5, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 2, 11, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 3, 3, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 1, 5, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 3, 11, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 3, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 2, 1, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 4, 6, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 4, 3, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 2, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 3, 10, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 4, 5, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 4, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 2, 1, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (69, 2, 4, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (77, 3, 2, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 1, 2, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 4, 2, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 4, 7, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 2, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 1, 10, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 3, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 4, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 2, 11, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 2, 2, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 3, 9, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 2, 6, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 1, 5, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 2, 10, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 1, 10, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 4, 3, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 3, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 4, 11, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 4, 9, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 1, 9, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 4, 4, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 2, 3, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 2, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 4, 7, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 1, 10, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 4, 9, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 4, 9, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 3, 5, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (69, 3, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 1, 5, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 4, 9, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 1, 8, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 1, 11, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 1, 5, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 4, 3, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 2, 9, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 1, 11, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (78, 3, 1, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 1, 1, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 2, 2, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 4, 11, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 3, 8, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 3, 4, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 3, 5, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 2, 5, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 1, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 1, 4, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 1, 5, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 2, 5, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 1, 7, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 1, 7, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 2, 1, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 1, 10, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 3, 5, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 3, 3, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 1, 2, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 4, 11, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 1, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 1, 9, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 1, 8, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 1, 6, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 4, 1, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 2, 11, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 3, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 2, 8, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 1, 8, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 1, 5, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 1, 10, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 1, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 1, 7, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 3, 11, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 2, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 2, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 3, 6, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 1, 1, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 3, 5, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 4, 11, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 3, 11, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 3, 11, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 4, 11, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 2, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 2, 7, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 3, 2, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 3, 8, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (69, 2, 10, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 2, 6, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 4, 10, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 1, 4, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 3, 1, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 3, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 2, 9, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 3, 6, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 4, 6, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 3, 5, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 1, 5, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 3, 3, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 2, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 1, 2, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 4, 9, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 2, 9, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 3, 12, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 4, 7, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 2, 11, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 2, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 2, 7, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 2, 12, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 2, 5, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 2, 11, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 4, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 2, 5, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 3, 6, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 1, 7, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 3, 12, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 1, 9, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 3, 6, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 2, 7, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 3, 1, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 1, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (77, 4, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 1, 10, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 3, 2, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 3, 11, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 4, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 4, 5, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 4, 10, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 3, 4, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 1, 6, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 4, 10, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 1, 5, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 4, 7, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 1, 7, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 2, 6, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 2, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 2, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 3, 8, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 3, 5, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 3, 6, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 3, 3, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 2, 11, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 4, 2, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 1, 11, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 1, 8, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 2, 11, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 1, 3, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 3, 12, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 3, 12, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 2, 4, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 1, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 2, 9, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 3, 2, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 3, 10, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 2, 2, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 1, 8, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 3, 9, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 2, 5, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 4, 7, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 4, 3, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 1, 12, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 3, 4, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 1, 8, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 1, 10, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (94, 4, 9, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 3, 11, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 4, 12, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 1, 1, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 2, 10, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 2, 2, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 3, 11, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 2, 3, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 1, 11, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 1, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 3, 5, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 3, 8, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 1, 11, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 3, 3, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 1, 10, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 3, 10, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 2, 3, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 3, 4, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 2, 1, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 3, 12, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 4, 4, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 2, 10, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 2, 3, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 4, 1, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 2, 11, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 3, 6, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 2, 3, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 2, 10, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 3, 2, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 2, 2, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 1, 11, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 3, 9, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 2, 12, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 2, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 1, 5, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 3, 5, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 2, 9, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 4, 6, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 3, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 3, 6, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 4, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 3, 4, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 1, 5, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 4, 4, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 3, 3, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 4, 1, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 4, 1, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 2, 1, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 2, 7, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 2, 8, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 3, 10, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 3, 3, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 1, 3, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 1, 7, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 2, 5, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 3, 2, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 2, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 4, 11, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 4, 6, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 3, 9, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 2, 7, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 4, 1, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 2, 11, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 2, 7, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 3, 2, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 1, 4, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 2, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 3, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 4, 1, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 4, 4, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 2, 5, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 4, 11, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 1, 10, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 3, 12, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 2, 7, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 1, 11, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 4, 9, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 2, 1, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 4, 12, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 2, 6, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 4, 7, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (112, 3, 1, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 3, 2, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 3, 12, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 2, 8, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 2, 9, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 2, 8, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 2, 1, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 4, 9, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 3, 7, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 4, 2, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 4, 4, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 3, 3, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 3, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 2, 1, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 4, 12, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 2, 10, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 1, 8, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 4, 3, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 1, 12, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 4, 2, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 4, 3, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (112, 3, 9, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 3, 3, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 3, 11, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 2, 10, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 2, 1, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 3, 3, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 3, 2, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 2, 8, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 1, 4, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 3, 9, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 1, 7, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 1, 9, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 4, 5, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 3, 11, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 1, 8, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 3, 9, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 1, 12, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (69, 3, 5, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 4, 7, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 2, 7, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 1, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 2, 7, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 4, 5, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 4, 6, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 4, 6, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 1, 1, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 4, 7, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 4, 3, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 2, 9, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 4, 7, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 2, 9, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 4, 6, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 4, 9, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 2, 11, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 2, 8, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 3, 7, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 3, 7, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 2, 11, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 4, 6, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 4, 4, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 1, 3, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 4, 6, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 1, 5, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 2, 3, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 4, 11, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 4, 12, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 2, 5, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 3, 8, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 3, 7, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 2, 5, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 3, 1, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 4, 6, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (78, 2, 1, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 3, 4, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 2, 11, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 3, 6, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 2, 10, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 1, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 1, 3, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 4, 4, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 1, 9, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 1, 7, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 2, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 3, 2, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 3, 5, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 3, 4, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 4, 7, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 2, 4, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 4, 2, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 3, 11, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 4, 11, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 3, 11, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 3, 10, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 4, 5, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 1, 8, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 2, 8, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 4, 9, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 4, 8, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (77, 2, 10, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 3, 5, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 1, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 4, 6, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 3, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 4, 9, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 4, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 4, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 3, 10, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 2, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 2, 4, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 1, 1, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 4, 11, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 3, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 2, 2, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 1, 1, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 2, 1, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 4, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 4, 11, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 3, 4, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 4, 9, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 1, 6, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 2, 6, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 3, 11, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 2, 11, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 3, 10, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 1, 10, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 3, 11, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 2, 11, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 3, 12, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 2, 3, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 3, 3, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 3, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 1, 7, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (78, 2, 5, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 1, 5, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 2, 1, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 2, 9, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 2, 10, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 3, 2, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 2, 10, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 4, 11, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 2, 4, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 3, 5, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 2, 10, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 1, 4, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 1, 5, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 2, 8, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 1, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 4, 6, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 1, 10, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 1, 7, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 3, 11, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 3, 3, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 2, 12, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 4, 4, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 2, 3, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 3, 7, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 4, 11, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 1, 1, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 2, 4, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (69, 1, 1, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 3, 11, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 4, 11, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 2, 5, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 2, 8, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 3, 10, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 3, 1, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 2, 3, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 4, 12, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 2, 7, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 2, 9, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 3, 10, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 3, 8, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 1, 1, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 1, 5, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 4, 1, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 2, 11, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 1, 6, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 4, 5, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 1, 1, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 2, 2, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 3, 5, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 3, 9, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 4, 6, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 2, 10, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (69, 2, 9, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 1, 4, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 3, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 2, 10, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 2, 5, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 3, 5, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 1, 1, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 1, 10, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 2, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 2, 12, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 4, 4, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 4, 1, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 1, 2, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 1, 12, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 4, 7, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 3, 4, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 3, 4, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 3, 9, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 1, 9, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 1, 7, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 3, 6, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 3, 5, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 1, 4, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 2, 6, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 1, 2, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (77, 3, 1, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 2, 10, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (94, 2, 3, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 4, 2, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (116, 4, 5, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 1, 3, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 1, 1, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 3, 8, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (78, 1, 9, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 2, 11, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 2, 3, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 1, 1, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 2, 11, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 1, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 2, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 4, 9, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 1, 5, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 4, 10, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 3, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 2, 5, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 3, 8, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 4, 7, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 4, 2, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 1, 9, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 4, 1, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 4, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 3, 10, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 2, 7, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 1, 1, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 1, 3, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 4, 10, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 4, 11, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 2, 10, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 1, 8, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 3, 9, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 2, 12, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 4, 10, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 2, 10, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 1, 1, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (67, 3, 6, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (90, 3, 9, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 1, 3, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 4, 9, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (112, 1, 4, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 4, 2, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 3, 12, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 3, 6, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 4, 11, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 3, 5, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 2, 4, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (69, 3, 1, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 1, 8, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 2, 9, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (78, 4, 11, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 3, 10, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 1, 9, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 3, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 1, 5, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 1, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (77, 3, 3, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 2, 2, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 3, 12, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 2, 4, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 1, 10, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 1, 2, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 4, 8, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 4, 2, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 2, 5, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 2, 9, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 1, 8, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 4, 12, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 2, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 2, 1, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 2, 1, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 1, 10, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 4, 5, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 4, 6, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 4, 8, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (94, 1, 1, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 4, 1, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 3, 11, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (112, 2, 12, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 1, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 1, 1, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 1, 12, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 2, 7, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (103, 3, 2, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (89, 1, 11, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 3, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 2, 5, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (112, 1, 11, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 1, 2, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 2, 2, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (94, 2, 8, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 2, 4, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 4, 11, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 4, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 4, 9, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 2, 2, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 2, 10, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 4, 11, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (112, 3, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 4, 9, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 3, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 4, 7, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 2, 2, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (63, 2, 10, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 2, 10, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 2, 3, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 4, 7, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 2, 4, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 3, 10, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 4, 10, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 2, 12, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 1, 1, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 3, 1, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 1, 10, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 4, 3, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 1, 2, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 4, 8, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 1, 2, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 2, 5, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 2, 4, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 2, 11, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 1, 11, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 1, 7, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 4, 1, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 1, 1, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 1, 9, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 3, 8, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 4, 12, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 2, 10, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 2, 6, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 2, 4, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 2, 4, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 2, 9, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 3, 6, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 1, 9, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 3, 11, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 2, 3, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 3, 6, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 4, 3, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 2, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 1, 6, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 3, 7, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 4, 11, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (94, 3, 7, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 3, 11, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 1, 8, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 1, 7, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 4, 12, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (85, 4, 9, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 3, 7, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 3, 8, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 1, 5, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 4, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (100, 4, 3, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (78, 3, 5, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 4, 7, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 4, 3, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (74, 3, 11, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 4, 10, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 2, 2, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 4, 11, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 4, 3, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (97, 2, 5, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 2, 11, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (80, 3, 2, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 3, 11, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 3, 2, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (96, 3, 3, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 4, 8, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 3, 11, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 2, 5, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (65, 2, 5, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 1, 3, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 4, 9, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 1, 10, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 1, 11, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 2, 5, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (77, 1, 3, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 1, 4, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (94, 3, 9, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 3, 2, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 1, 5, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 4, 8, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (112, 1, 9, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 3, 4, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (66, 4, 1, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 1, 11, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 2, 7, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 2, 6, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (76, 4, 1, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 4, 9, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (105, 4, 9, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 2, 12, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 4, 10, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 2, 3, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 1, 6, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 4, 10, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (112, 3, 5, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 1, 12, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 4, 11, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 3, 8, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 2, 6, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 2, 12, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 1, 10, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 1, 11, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 3, 9, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 4, 6, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (111, 4, 8, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (88, 2, 9, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 3, 6, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (87, 4, 4, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 4, 2, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 1, 4, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 4, 9, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (98, 4, 7, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 1, 2, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 2, 7, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 1, 10, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 1, 11, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 2, 7, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 1, 3, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 3, 11, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 4, 3, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (102, 1, 7, 13);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (107, 4, 8, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (117, 4, 3, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (114, 1, 10, 4);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (86, 4, 6, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 1, 2, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (115, 1, 7, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 3, 9, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (108, 1, 7, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (81, 2, 8, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (72, 2, 9, 2);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (94, 1, 11, 9);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (73, 3, 12, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 4, 2, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 4, 6, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (110, 4, 2, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 1, 3, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (61, 2, 1, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (120, 1, 6, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 3, 5, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (70, 3, 5, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 1, 4, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (92, 3, 1, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (68, 3, 6, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 3, 8, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (69, 1, 1, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (79, 2, 1, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (109, 3, 3, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (113, 2, 4, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 1, 9, 8);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (84, 4, 9, 3);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 4, 7, 5);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 2, 5, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (83, 3, 4, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (82, 1, 4, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (75, 4, 1, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 1, 7, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 2, 2, 1);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (93, 1, 2, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (64, 1, 5, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (99, 3, 3, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (101, 4, 1, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (60, 1, 11, 7);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (91, 4, 12, 10);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (62, 1, 8, 15);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (95, 2, 12, 6);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (119, 1, 5, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (71, 2, 4, 11);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 3, 10, 12);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (106, 3, 8, 16);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (104, 3, 9, 14);
INSERT INTO Spectacles.Billet (CoutBillet, NbBillet, RepresentationID, ClientID)
VALUES (118, 1, 4, 9);

