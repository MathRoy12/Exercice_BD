USE R22_Billeterie
GO

-- CREATION DE LA TABLE AFFICHE (Rencontre 19)


-- AJOUT du lien de clé étrangère

-- Insertion des images
INSERT INTO Spectacles.Affiche(SpectacleID,AfficheContent)
SELECT 1, BulkColumn FROM OPENROWSET(
	BULK 'C:\Users\benoit.caldairou\source\repos\WrapUpBilleterie\Affiches\LaMelodieDuBonheur.jfif', SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID,AfficheContent)
SELECT 2, BulkColumn FROM OPENROWSET(
	BULK 'C:\Users\benoit.caldairou\source\repos\WrapUpBilleterie\Affiches\Verdict.jfif', SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID,AfficheContent)
SELECT 3, BulkColumn FROM OPENROWSET(
	BULK 'C:\Users\benoit.caldairou\source\repos\WrapUpBilleterie\Affiches\AndreEtDorine.jfif', SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID,AfficheContent)
SELECT 4, BulkColumn FROM OPENROWSET(
	BULK 'C:\Users\benoit.caldairou\source\repos\WrapUpBilleterie\Affiches\LesDixCommandementsDeDorothéeDix.jfif', SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID,AfficheContent)
SELECT 5, BulkColumn FROM OPENROWSET(
	BULK 'C:\Users\benoit.caldairou\source\repos\WrapUpBilleterie\Affiches\LaMachineDeTuring.jfif', SINGLE_BLOB) AS myfile

