CREATE NONCLUSTERED INDEX IX_Etudiant_PrenomNom ON Etudiants.Etudiant(Prenom,Nom);
GO
CREATE NONCLUSTERED INDEX IX_EtudiantFruit_IDs ON Fruits.EtudiantFruit(EtudiantID,FruitID);