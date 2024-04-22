USE R22_Billeterie
GO

CREATE VIEW Spectacles.VW_SpectaclesRepresentationSpectateur
AS
SELECT S.SpectacleID, S.Nom, S.Debut, S.Fin, COUNT(DISTINCT R.RepresentationID) AS [NbRepresentation], SUM(B.NbBillet) AS [NbBilletsVendus], S.Prix
FROM Spectacles.Spectacle AS S
INNER JOIN Spectacles.Representation R on S.SpectacleID = R.SpectacleID
INNER JOIN Spectacles.Billet B on R.RepresentationID = B.RepresentationID
GROUP BY S.SpectacleID, S.Nom, S.Debut, S.Fin, S.Prix
