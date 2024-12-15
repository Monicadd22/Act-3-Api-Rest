create database Monica Maricela Demera Demera;
use Monica_api;
 create table estudiantes(
 id_estudiante int primary key,
 nombres varchar(30),
 apellidos varchar(30),
 edad varchar(10));

create table cursos(
id_curso int primary key,
nombre_curso varchar(30),
id_estudiante int,
 FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante));
 
insert into estudiantes (id_estudiante,nombres,apellidos,edad) values (001,'Luis', 'Rodgrigues', 19);
insert into estudiantes (id_estudiante,nombres,apellidos,edad) values (002,'Edwin', 'Holguin', 22);
insert into estudiantes (id_estudiante,nombres,apellidos,edad) values (003,'Cristhian', 'Zambrano', 20);
insert into estudiantes (id_estudiante,nombres,apellidos,edad) values (004,'Jorge', 'Saltos', 23);
insert into estudiantes (id_estudiante,nombres,apellidos,edad) values (005,'Paul', 'Hidalgo', 24);

insert into cursos (id_curso,nombre_curso,id_estudiante) values (100,'Matematicas', 001);
insert into cursos (id_curso,nombre_curso,id_estudiante) values (101,'Historia', 002);
insert into cursos (id_curso,nombre_curso,id_estudiante) values (102,'Ciencias', 003);
insert into cursos (id_curso,nombre_curso,id_estudiante) values (103,'Filosofia', 004);
insert into cursos (id_curso,nombre_curso,id_estudiante) values (104,'literatura', 005);
insert into cursos (id_curso,nombre_curso,id_estudiante) values (105,'Ingles', 005);


select *from cursos;

SELECT cursos.nombre_curso, estudiantes.nombres, estudiantes.apellidos
FROM cursos
INNER JOIN estudiantes ON cursos.id_estudiante = estudiantes.id_estudiante;



SELECT estudiantes.nombres, estudiantes.apellidos, COUNT(cursos.id_curso) AS numero_de_cursos
FROM estudiantes
LEFT JOIN cursos ON estudiantes.id_estudiante = cursos.id_estudiante
GROUP BY estudiantes.id_estudiante;



SELECT estudiantes.nombres, estudiantes.apellidos
FROM estudiantes
INNER JOIN cursos ON estudiantes.id_estudiante = cursos.id_estudiante
GROUP BY estudiantes.id_estudiante
HAVING COUNT(cursos.id_curso) > 1;



SELECT nombre_curso
FROM cursos
WHERE id_estudiante = (SELECT id_estudiante FROM estudiantes WHERE nombres = 'Paul ' AND apellidos = 'Hidalgo');



SELECT nombres, apellidos
FROM estudiantes
WHERE id_estudiante NOT IN (SELECT DISTINCT id_estudiante FROM cursos);
