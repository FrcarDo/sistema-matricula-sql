-- IMPLEMENTACIÓN DE LA BASE DE DATOS 

INSERT INTO GRADO (idgrado, nombre, nivel) VALUES (1, 'Inicial 3 años', 'Inicial');
INSERT INTO GRADO (idgrado, nombre, nivel) VALUES (2, 'Inicial 4 años', 'Inicial');
INSERT INTO GRADO (idgrado, nombre, nivel) VALUES (3, 'Inicial 5 años', 'Inicial');

INSERT INTO CURSO (idcurso, nombre, horas_semanales) VALUES (1, 'Matemáticas', 5);
INSERT INTO CURSO (idcurso, nombre, horas_semanales) VALUES (2, 'Comunicación', 5);
INSERT INTO CURSO (idcurso, nombre, horas_semanales) VALUES (3, 'Ciencia', 4);
INSERT INTO CURSO (idcurso, nombre, horas_semanales) VALUES (4, 'Tutoría', 2);

INSERT INTO DOCENTE (iddocente, nombre, apellido, especialidad, correo, telefono, dni) 
VALUES (1, 'Lucía', 'Gonzales', 'Matemáticas', 'lucia.gonzales@colegio.edu', '987654321', '12345678');
INSERT INTO DOCENTE (iddocente, nombre, apellido, especialidad, correo, telefono, dni) 
VALUES (2, 'María', 'Ríos', 'Comunicación', 'maria.rios@colegio.edu', '987654322', '22345678');
INSERT INTO DOCENTE (iddocente, nombre, apellido, especialidad, correo, telefono, dni) 
VALUES (3, 'Carlos', 'Torres', 'Educación Física', 'carlos.torres@colegio.edu', '987654323', '32345678');

INSERT INTO RESPONSABLE (idresponsable, nombres, apellidos, parentesco, telefono, correo, dni)
VALUES (1, 'Jorge', 'García Montes', 'Padre', '999888777', 'jorge.garcia@email.com', '87654321');
INSERT INTO RESPONSABLE (idresponsable, nombres, apellidos, parentesco, telefono, correo, dni)
VALUES (2, 'María', 'López Fernández', 'Madre', '999888776', 'maria.lopez@email.com', '87654322');

INSERT INTO SEGURO (idseguro, proveedor, fecha_vigencia, estado)
VALUES (1, 'RIMAC', TO_DATE('31-12-2025', 'DD-MM-YYYY'), 'Vigente');
INSERT INTO SEGURO (idseguro, proveedor, fecha_vigencia, estado)
VALUES (2, 'Pacifico', TO_DATE('31-12-2024', 'DD-MM-YYYY'), 'Vencido');

INSERT INTO SECCION (idseccion, grado, letra, turno, iddocente_tutor)
VALUES (1, 1, 'A', 'Mañana', 1);
INSERT INTO SECCION (idseccion, grado, letra, turno, iddocente_tutor)
VALUES (2, 1, 'B', 'Mañana', 2);
INSERT INTO SECCION (idseccion, grado, letra, turno, iddocente_tutor)
VALUES (3, 2, 'A', 'Mañana', 1);

INSERT INTO INTERESADO (idalumno, nombres, apellidos, fecha_nacimiento, dni, correo_institucional, idseccion, idseguro, idresponsable)
VALUES (1, 'Juan', 'Pérez García', TO_DATE('15-05-2020', 'DD-MM-YYYY'), '12345679', 'juan.perez@colegio.edu', 1, 1, 1);
INSERT INTO INTERESADO (idalumno, nombres, apellidos, fecha_nacimiento, dni, correo_institucional, idseccion, idseguro, idresponsable)
VALUES (2, 'Ana', 'López Martínez', TO_DATE('20-06-2020', 'DD-MM-YYYY'), '12345680', 'ana.lopez@colegio.edu', 1, 1, 2);
INSERT INTO INTERESADO (idalumno, nombres, apellidos, fecha_nacimiento, dni, correo_institucional, idseccion, idseguro, idresponsable)
VALUES (3, 'Luis', 'García López', TO_DATE('10-04-2020', 'DD-MM-YYYY'), '12345681', 'luis.garcia@colegio.edu', 2, 2, 1);

INSERT INTO MATRICULA (idmatricula, fecha_matricula, idalumno, estado)
VALUES (1, TO_DATE('01-03-2025', 'DD-MM-YYYY'), 1, 'Activa');
INSERT INTO MATRICULA (idmatricula, fecha_matricula, idalumno, estado)
VALUES (2, TO_DATE('01-03-2025', 'DD-MM-YYYY'), 2, 'Activa');
INSERT INTO MATRICULA (idmatricula, fecha_matricula, idalumno, estado)
VALUES (3, TO_DATE('02-03-2025', 'DD-MM-YYYY'), 3, 'Activa');

INSERT INTO DOCENTE_GRADO (idgrado, iddocente) VALUES (1, 1);
INSERT INTO DOCENTE_GRADO (idgrado, iddocente) VALUES (1, 2);
INSERT INTO DOCENTE_GRADO (idgrado, iddocente) VALUES (2, 1);
INSERT INTO DOCENTE_GRADO (idgrado, iddocente) VALUES (3, 3);

INSERT INTO DOCENTE_CURSO (iddocente, idcurso) VALUES (1, 1);
INSERT INTO DOCENTE_CURSO (iddocente, idcurso) VALUES (1, 2);
INSERT INTO DOCENTE_CURSO (iddocente, idcurso) VALUES (2, 2);
INSERT INTO DOCENTE_CURSO (iddocente, idcurso) VALUES (3, 3);

COMMIT;