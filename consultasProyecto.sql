SELECT * FROM Alumno;

SELECT Nombre, Apellido, Edad
FROM Instructor
WHERE Edad > 30;

SELECT c.IDclase, a.Nombre AS Alumno, i.Nombre AS Instructor, c.Fecha, c.Hora_inicio, c.Hora_fin
FROM ClasePractica c
JOIN Alumno a ON c.IDalumno = a.IDalumno
JOIN Instructor i ON c.IDinstructor = i.IDinstructor
WHERE c.Fecha = '2024-04-10';

SELECT r.IDresultado, a.Nombre, a.Apellido, r.Aciertos, r.Fallos, r.FechaRealizacion
FROM Resultado r
JOIN Alumno a ON r.IDalumno = a.IDalumno
WHERE r.Aciertos > 5;

SELECT n.Mensaje, n.Fecha, n.Tipo
FROM Notificacion n
JOIN Alumno a ON n.IDalumno = a.IDalumno
WHERE a.Dni = '50586494A';

SELECT a.Nombre, a.Apellido, COUNT(t.IDtest) AS NumTests
FROM Alumno a
LEFT JOIN Test t ON a.IDalumno = t.IDalumno
GROUP BY a.IDalumno;

INSERT INTO Alumno (IDalumno, Nombre, Apellido, Dni, Email, Telefono)
VALUES (1, 'Carlos', 'Gómez', '98765432B', 'carlos@example.com', '612345678');

UPDATE Alumno
SET Email = 'nuevoemail@example.com'
WHERE IDalumno = 1;

SELECT a.Nombre, a.Apellido, AVG(r.Aciertos) AS PromedioAciertos
FROM Resultado r
JOIN Alumno a ON r.IDalumno = a.IDalumno
GROUP BY a.IDalumno;
