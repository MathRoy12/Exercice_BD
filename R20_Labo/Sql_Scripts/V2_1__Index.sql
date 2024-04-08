-- J'ai créé cet Index car les attribut UtilisateurID et CourseID sont utiliser dans une vue pour faire des inner join
CREATE NONCLUSTERED INDEX IX_ParticipationCourse_IDs ON Courses.ParticipationCourse(UtilisateurID,CourseID)
GO

--J'ai créé cet Index car ce sont les deux seul paramètre utiliser de cette table
CREATE NONCLUSTERED INDEX IX_Course_Course ON Courses.Course(CourseID,Nom)
GO

--J'ai créé cet Index car ce sont les deux seul paramètre utiliser de cette table
CREATE NONCLUSTERED INDEX IX_Utilisateur_Utilisateur ON Utilisateurs.Utilisateur(UtilisateurID, Pseudo)
GO
