CREATE DATABASE R19_Labo;
GO

-- Configurer un nouveau filegroup ici
EXEC sp_configure filestream_access_level, 2 RECONFIGURE

ALTER DATABASE R19_Labo
    ADD FILEGROUP FG_Images CONTAINS FILESTREAM;
GO
ALTER DATABASE R19_Labo
    ADD FILE (
        NAME = FG_Images,
        FILENAME = 'C:\EspaceLabo\FG_Images'
        )
        TO FILEGROUP FG_Images
GO