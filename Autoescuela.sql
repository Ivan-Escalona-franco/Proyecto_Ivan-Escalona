Drop database if exists AutoEscula;
create database AutoEscula;
use AutoEscula;


CREATE TABLE Alumno (
    IDalumno INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Dni VARCHAR(10),
    Email VARCHAR(100),
    Telefono VARCHAR(15)
);

CREATE TABLE Instructor (
    IDinstructor INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Edad INT,
    Comentarios TEXT
);

CREATE TABLE ClasePractica (
    IDclase INT PRIMARY KEY,
    IDalumno INT,
    IDinstructor INT,
    Fecha DATE,
    Hora_inicio TIME,
    Hora_fin TIME,
    FOREIGN KEY (IDalumno) REFERENCES Alumno(IDalumno),
    FOREIGN KEY (IDinstructor) REFERENCES Instructor(IDinstructor)
);

CREATE TABLE Test (
    IDtest INT PRIMARY KEY,
    IDalumno INT,
    NumPreguntas INT,
    FOREIGN KEY (IDalumno) REFERENCES Alumno(IDalumno)
);

CREATE TABLE Pregunta (
    IDpregunta INT PRIMARY KEY,
    IDtest INT,
    RespuestaCorrecta TEXT,
    Numero_de_preguntas INT,
    Respuestas_por_preguntas TEXT,
    FOREIGN KEY (IDtest) REFERENCES Test(IDtest)
);

CREATE TABLE Resultado (
    IDresultado INT PRIMARY KEY,
    IDtest INT,
    IDalumno INT,
    FechaRealizacion DATE,
    Aciertos INT,
    Fallos INT,
    FOREIGN KEY (IDtest) REFERENCES Test(IDtest),
    FOREIGN KEY (IDalumno) REFERENCES Alumno(IDalumno)
);

CREATE TABLE Notificacion (
    IDnotificacion INT PRIMARY KEY,
    IDalumno INT,
    IDresultado INT,
    Tipo VARCHAR(50),
    Mensaje TEXT,
    Fecha DATE,
    FOREIGN KEY (IDalumno) REFERENCES Alumno(IDalumno),
    FOREIGN KEY (IDresultado) REFERENCES Resultado(IDresultado)
);

