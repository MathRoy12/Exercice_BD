-- Table d'utilisateurs

CREATE TABLE Utilisateurs.Utilisateur
(
    UtilisateurID   int IDENTITY (1,1),
    Pseudo          nvarchar(50)   NOT NULL,
    MotDePasseHache varbinary(32)  NOT NULL,
    Sel             varbinary(16)  NOT NULL,
    CouleurPrefere  varbinary(max) NOT NULL,
    CONSTRAINT PK_Utilisateur_UtilisateurID PRIMARY KEY (UtilisateurID)
);
GO

-- Contraintes

ALTER TABLE Utilisateurs.Utilisateur
    ADD CONSTRAINT
        UC_Utilisateur_Pseudo UNIQUE (Pseudo);
GO

-- Créer une clé maîtresse avec un mot de passe
-- ?
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'CeciE5tUn10ngM0tDeP455e!';
GO
-- Créer un certificat auto-signé
-- ?
CREATE CERTIFICATE MonCertificat WITH SUBJECT = 'ChiffrementCouleur';
GO
-- Créer une clé symétrique
-- ?
CREATE SYMMETRIC KEY MaSuperCle WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE MonCertificat;
GO

-- Procédure inscription
CREATE PROCEDURE Utilisateurs.USP_CreerUtilisateur @Pseudo nvarchar(50),
                                                   @MotDePasse nvarchar(50),
                                                   @Couleur nvarchar(30)
AS
BEGIN

    DECLARE @Sel varbinary(16) = CRYPT_GEN_RANDOM(16);
    DECLARE @MdpEtSel nvarchar(116) = CONCAT(@MotDePasse, @Sel);
    DECLARE @MdpHash varbinary(32) = HASHBYTES('SHA2_256', @MdpEtSel);

    OPEN SYMMETRIC KEY MaSuperCle
        DECRYPTION BY CERTIFICATE MonCertificat;

    DECLARE @CouleurChiffree varbinary(max) = ENCRYPTBYKEY(KEY_GUID('MaSuperCle'), @Couleur);

    CLOSE SYMMETRIC KEY MaSuperCle

    INSERT INTO Utilisateurs.Utilisateur (Pseudo, MotDePasseHache, Sel, CouleurPrefere)
    VALUES (@Pseudo, @MdpHash, @Sel, @CouleurChiffree);

END
GO

-- Procédure authentification

CREATE PROCEDURE Utilisateurs.USP_AuthUtilisateur @Pseudo nvarchar(50),
                                                  @MotDePasse nvarchar(50)
AS
BEGIN

    DECLARE @MdpHash nvarchar(50), @Sel varbinary(16);
    SELECT @MdpHash = MotDePasseHache, @Sel = Sel
    FROM Utilisateurs.Utilisateur
    WHERE Pseudo = @Pseudo;

    IF HASHBYTES('SHA2_256', CONCAT(@MotDePasse, @Sel)) = @MdpHash
        BEGIN
            SELECT * FROM Utilisateurs.Utilisateur WHERE Pseudo = @Pseudo;
        END
    ELSE
        BEGIN
            SELECT TOP 0 * FROM Utilisateurs.Utilisateur;
        END
END
GO

-- Insertions de quelques utilisateurs (si jamais inscription ne marche pas, testez au moins la connexion / déconnexion)

EXEC Utilisateurs.USP_CreerUtilisateur @Pseudo = 'max', @MotDePasse = 'Salut1!', @Couleur = 'indigo';
GO

EXEC Utilisateurs.USP_CreerUtilisateur @Pseudo = 'chantal', @MotDePasse = 'Allo2!', @Couleur = 'bourgogne';
GO

EXEC Utilisateurs.USP_CreerUtilisateur @Pseudo = 'kamalPro', @MotDePasse = 'Bonjour3!', @Couleur = 'cramoisi';
GO
	
	
	
	

	
	