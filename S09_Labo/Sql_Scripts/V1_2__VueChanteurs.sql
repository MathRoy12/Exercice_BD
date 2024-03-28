-- Nouvelle vue

CREATE VIEW Musique.VW_ChanteurNbChansons AS
SELECT CHT.ChanteurID, CHT.Nom, CHT.DateNaissance, COUNT(CHS.ChanteurID) AS [Nombre de chansons]
FROM Musique.Chanteur CHT
         INNER JOIN Musique.Chanson CHS ON CHT.ChanteurID = CHS.ChanteurID
GROUP BY CHT.ChanteurID, CHT.Nom, CHT.DateNaissance

-- ?

GO

-- Résultat souhaité : id du chanteur, nom du chanteur, date de naissance et son nombre de chansons

-- ChanteurID |Nom  | Date de naissance |Nombre de chansons
-- -----------|-----|-------------------|-------------------