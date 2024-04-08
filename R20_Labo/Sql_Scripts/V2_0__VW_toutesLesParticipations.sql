CREATE VIEW Courses.vw_toutesLesParticipations
AS
SELECT P.ParticipationCourseID,
       P.UtilisateurID,
       U.Pseudo,
       P.CourseID,
       C.Nom,
       P.NbJoueurs,
       P.Position,
       P.Chrono,
       P.DateParticipation
FROM Courses.ParticipationCourse P
         INNER JOIN Utilisateurs.Utilisateur U ON P.UtilisateurID = U.UtilisateurID
         INNER JOIN Courses.Course C ON P.CourseID = C.CourseID
        