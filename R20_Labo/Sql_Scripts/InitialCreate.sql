-- •○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•
--				Création de la BD
-- •○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•○•

USE MASTER;
GO

IF EXISTS(SELECT * FROM sys.databases WHERE name='SussyKart')
BEGIN
    DROP DATABASE SussyKart
END
CREATE DATABASE SussyKart
