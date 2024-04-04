ALTER TABLE Fruits.Fruit
    ADD
        Identifiant uniqueidentifier NOT NULL ROWGUIDCOL DEFAULT newid();
GO

ALTER TABLE Fruits.Fruit
    ADD CONSTRAINT
        UC_Fruit_Identifiant UNIQUE (Identifiant);
GO

ALTER TABLE Fruits.Fruit
    ADD
        Photo varbinary(max) FILESTREAM NULL;
GO