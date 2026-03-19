# Sistema de Gestión de Matrículas

Proyecto de base de datos orientado a la gestión del proceso de matrícula de un colegio. Fue desarrollado como parte de un trabajo académico del curso de Base de Datos.

## Descripción

El objetivo del proyecto es modelar y estructurar la información relacionada a estudiantes, docentes, secciones y matrículas, reemplazando procesos manuales por un sistema organizado y consistente.

La base de datos permite registrar alumnos, asignarlos a secciones, gestionar responsables (padres de familia) y controlar las matrículas, asegurando integridad mediante llaves y restricciones.

## Tecnologías

* SQL (Oracle)
* PL/SQL

## Estructura

* `schema.sql`: creación de tablas y relaciones
* `inserts.sql`: datos de ejemplo
* `triggers.sql`: validaciones de negocio

## Modelo

Incluye entidades principales como:

* INTERESADO (alumnos)
* DOCENTE
* SECCION
* MATRICULA
* RESPONSABLE

También se implementan relaciones muchos a muchos como:

* DOCENTE_CURSO
* DOCENTE_GRADO

## Validaciones

Se implementaron triggers para:

* Limitar la cantidad de alumnos por sección
* Evitar correos duplicados en docentes

## Contexto

Proyecto desarrollado en equipo. Participé en el modelado de la base de datos y en la implementación en SQL.

## Notas

El proyecto puede extenderse con una interfaz de usuario o integrarse con herramientas de visualización de datos.
