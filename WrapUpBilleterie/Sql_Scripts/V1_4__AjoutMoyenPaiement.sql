USE R22_Billeterie
GO

-- Création de la table des moyens de paiments (des cartes de crédit)
CREATE TABLE Clients.CarteBancaire(
	
)
GO

-- Création d'une table pour exécuter la procédure de récupération des infos de paiement
CREATE TABLE Clients.CarteBancaireEnClair(
	
)
GO

-- Contrainte de clé étrangère


-- On définit une procédure pour ajouter un nouvelle carte bancaire dans la table
CREATE PROCEDURE Clients.USP_AjouterCarteBancaire(@Courriel nvarchar(256), @Numero nvarchar(16), @Echeance nchar(5))
AS
BEGIN
	-- On déclare qques variables
	DECLARE @ClientID int
	
	-- On récupère le ClientID
	

	-- On chiffre les données
	
	-- On insert

END
GO

-- On définit une procédure pour récupérer les données de la carte bancaire
CREATE PROCEDURE Clients.USP_RecupererCarteBancaire(@ClientID int) 
AS
BEGIN
	
END
GO


-- On insert qques données
EXEC Clients.USP_AjouterCarteBancaire @Courriel='chantal.valliere@montpetit.ca', @Numero='1234123412341234', @Echeance='09/25'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='chantal.valliere@montpetit.ca', @Numero='1234123412341235', @Echeance='10/25'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='olivier.adam-larocque@montpetit.ca', @Numero='1234123412341236', @Echeance='03/26'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='laurence.bournival@montpetit.ca', @Numero='1234123412341239', @Echeance='02/29'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='david.chalifour@montpetit.ca', @Numero='1234123412341234', @Echeance='09/25'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='ameni.gagne@montpetit.ca', @Numero='1234643412341234', @Echeance='06/21'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='graham.milon@montpetit.ca', @Numero='1234123423341234', @Echeance='01/22'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='graham.milon@montpetit.ca', @Numero='1935743412341234', @Echeance='12/23'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='bruno.proulx@montpetit.ca', @Numero='4321123412341234', @Echeance='11/27'
