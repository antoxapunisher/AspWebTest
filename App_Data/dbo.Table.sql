CREATE TABLE [dbo].[Contacts] (
    [Id]          INT            NOT NULL IDENTITY,
    [Name]        NVARCHAR (MAX) NULL,
    [MobilePhone] NCHAR (10)     NULL,
    [JobTitle]    NVARCHAR (MAX) NULL,
    [BirthDate]   DATE            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);