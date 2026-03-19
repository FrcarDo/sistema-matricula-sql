-- SISTEMA DE GESTIÓN DE MATRÍCULAS COLEGIO ANGLO PERUANO CATÓLICO
-- Proyecto académico desarrollado como parte del curso de Base de Datos | Universidad [de Lima
-- Autor: Franco Cardó
-- Fecha: 2025

CREATE TABLE GRADO (
    idgrado NUMBER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    nivel VARCHAR2(30) NOT NULL
);

CREATE TABLE CURSO (
    idcurso NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    horas_semanales NUMBER NOT NULL
);

CREATE TABLE DOCENTE (
    iddocente NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    apellido VARCHAR2(100) NOT NULL,
    especialidad VARCHAR2(100),
    correo VARCHAR2(100) UNIQUE NOT NULL,
    telefono VARCHAR2(20),
    dni VARCHAR2(20) UNIQUE NOT NULL
);

CREATE TABLE RESPONSABLE (
    idresponsable NUMBER PRIMARY KEY,
    nombres VARCHAR2(100) NOT NULL,
    apellidos VARCHAR2(100) NOT NULL,
    parentesco VARCHAR2(50),
    telefono VARCHAR2(20) NOT NULL,
    correo VARCHAR2(100),
    dni VARCHAR2(20) UNIQUE NOT NULL
);

CREATE TABLE SEGURO (
    idseguro NUMBER PRIMARY KEY,
    proveedor VARCHAR2(100) NOT NULL,
    fecha_vigencia DATE NOT NULL,
    estado VARCHAR2(20) DEFAULT 'Vigente'
);

CREATE TABLE SECCION (
    idseccion NUMBER PRIMARY KEY,
    grado NUMBER NOT NULL,
    letra VARCHAR2(1) NOT NULL,
    turno VARCHAR2(20) NOT NULL,
    iddocente_tutor NUMBER NOT NULL,
    CONSTRAINT fk_seccion_grado FOREIGN KEY (grado) REFERENCES GRADO(idgrado),
    CONSTRAINT fk_seccion_tutor FOREIGN KEY (iddocente_tutor) REFERENCES DOCENTE(iddocente)
);

CREATE TABLE INTERESADO (
    idalumno NUMBER PRIMARY KEY,
    nombres VARCHAR2(100) NOT NULL,
    apellidos VARCHAR2(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    dni VARCHAR2(20) UNIQUE NOT NULL,
    correo_institucional VARCHAR2(100) UNIQUE,
    idseccion NUMBER NOT NULL,
    idseguro NUMBER NOT NULL,
    idresponsable NUMBER NOT NULL,
    CONSTRAINT fk_alumno_seccion FOREIGN KEY (idseccion) REFERENCES SECCION(idseccion),
    CONSTRAINT fk_alumno_seguro FOREIGN KEY (idseguro) REFERENCES SEGURO(idseguro),
    CONSTRAINT fk_alumno_responsable FOREIGN KEY (idresponsable) REFERENCES RESPONSABLE(idresponsable)
);

CREATE TABLE MATRICULA (
    idmatricula NUMBER PRIMARY KEY,
    fecha_matricula DATE DEFAULT SYSDATE,
    idalumno NUMBER NOT NULL,
    estado VARCHAR2(20) DEFAULT 'Activa',
    CONSTRAINT fk_matricula_alumno FOREIGN KEY (idalumno) REFERENCES INTERESADO(idalumno)
);

CREATE TABLE DOCENTE_GRADO (
    idgrado NUMBER NOT NULL,
    iddocente NUMBER NOT NULL,
    PRIMARY KEY (idgrado, iddocente),
    CONSTRAINT fk_dg_grado FOREIGN KEY (idgrado) REFERENCES GRADO(idgrado),
    CONSTRAINT fk_dg_docente FOREIGN KEY (iddocente) REFERENCES DOCENTE(iddocente)
);

CREATE TABLE DOCENTE_CURSO (
    iddocente NUMBER NOT NULL,
    idcurso NUMBER NOT NULL,
    PRIMARY KEY (iddocente, idcurso),
    CONSTRAINT fk_dc_docente FOREIGN KEY (iddocente) REFERENCES DOCENTE(iddocente),
    CONSTRAINT fk_dc_curso FOREIGN KEY (idcurso) REFERENCES CURSO(idcurso)
);