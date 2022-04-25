-- to create a new database
drop database  ProyectoWebEducativa;
Create database ProyectoWebEducativa;


-- to use database
USE ProyectoWebEducativa;

-- creating a new table
create table HorarioMateria(
IdHorario int not null,
IdMateria int  null,
IdProfesor int not null,
IdEstudiante int not null,
horaIni datetime not null,
horafin datetime not null,
CONSTRAINT FK_Hor_Mat2
    FOREIGN KEY (IdMateria)
    REFERENCES materia (IdMateria),
CONSTRAINT FK_Hor_Prof
FOREIGN KEY (IdProfesor)
REFERENCES profesor (IdProfesor),
CONSTRAINT FK_Hor_Est
FOREIGN KEY (IdEstudiante)
REFERENCES estudiante (IdEstudiante)
);

create table HorarioAdmin(
idHoradmin int not null ,
IdRol int not null,
horaIni datetime not null,
horafin datetime not null
);
alter table HorarioAdmin add CONSTRAINT FK_Rol_Admin
FOREIGN KEY (IdRol)
REFERENCES Rol (IdRol);
CREATE TABLE materia (
  IdMateria INT NULL DEFAULT NULL,
  IdNota INT NULL DEFAULT NULL,
  Nombre VARCHAR(40) NULL DEFAULT NULL,
  CodEstudiantil INT NULL DEFAULT NULL,
  IdProfesor INT NULL DEFAULT NULL,
  UNIQUE UC_IdNota (IdNota ));
  
   alter table materia
  modify IdNota INT not null ;
  alter table materia
  modify IdMateria INT not NULL;
  ALTER TABLE materia
ADD CONSTRAINT PK_Mat PRIMARY KEY (IdMateria);

SET SQL_SAFE_UPDATES = 0;
  -- INSERRT MATERIA
  delete from materia where IdMateria=3008;
  alter table materia
  drop   IdNota; 
SELECT * FROM materia;
delete from nota;
 DROP TABLE EntesEducativos;
 DROP TABLE curso;-- -----------------------------------------------------
-- Table `mydb`.`EntesEducativos`
-- -----------------------------------------------------
CREATE TABLE EntesEducativos (
  IdEnteEducativo INT NOT NULL,
  contraseña VARCHAR(100) NULL,
  direccion VARCHAR(100) NULL,
  celular INT NULL,
  CorreoPersonal VARCHAR(100) NULL,
  CorreoInstitucional VARCHAR(100) NULL,
  Cargo VARCHAR(100) NULL,
  PrimerNombre VARCHAR(45) NULL,
  SegundoNombre VARCHAR(45) NULL,
  PrimerApellido VARCHAR(45) NULL,
  SegundoApellido VARCHAR(45) NULL,
  FechaIngreso DATE NULL,
  PRIMARY KEY (IdEnteEducativo));
  
  
  alter table EntesEducativos drop contraseña;
  
  
 INSERT INTO EntesEducativos(IdEnteEducativo,contraseña,direccion,celular,CorreoPersonal,CorreoInstitucional,Cargo,PrimerNombre,SegundoNombre,PrimerApellido,SegundoApellido,FechaIngreso) 
VALUES ('1','asdcv35t','cra05#49a04',3009988761,'mrb@yahoo.co','mrubiano@usbbog.edu.co','Docente','Mary','Luz','Rubiano','Acosta','09/07/14'); 
INSERT INTO EntesEducativos(IdEnteEducativo,contraseña,direccion,celular,CorreoPersonal,CorreoInstitucional,Cargo,PrimerNombre,SegundoNombre,PrimerApellido,SegundoApellido,FechaIngreso) 
VALUES ('2','987yygh','cra9l#1011',3888765622,'mabc@yahoo.co','p.gsanchez@academia.usbbog.edu.co','Docente','Giovanni','','Sanchez','Prieto','04/04/05'); 
INSERT INTO EntesEducativos(IdEnteEducativo,contraseña,direccion,celular,CorreoPersonal,CorreoInstitucional,Cargo,PrimerNombre,SegundoNombre,PrimerApellido,SegundoApellido,FechaIngreso) 
VALUES ('3','0jgh37v2','cra18#69a35',3119988767,'dfg@yahoo.co','echamorro@usbbog.edu.co','Docente','Edgar','José','Chamorro','Gutierrez','10/06/00'); 
INSERT INTO EntesEducativos(IdEnteEducativo,contraseña,direccion,celular,CorreoPersonal,CorreoInstitucional,Cargo,PrimerNombre,SegundoNombre,PrimerApellido,SegundoApellido,FechaIngreso) 
VALUES ('4','asdcfvg','cra1#77a25',3009988768,'hfg@yahoo.co','p.jtovar@academia.usbbog.edu.co','Docente','Jhonatan','Paolo','Tovar','Soto','02/01/10'); 
 
 
 
  alter table EntesEducativos
  drop Cargo;
  
  alter table EntesEducativos
  modify celular BIGINT NULL;
  
  select * from EntesEducativos;
  
  CREATE TABLE EnteEducativoRol (
  IdEnteEducativo INT NOT NULL,
  IdEnteEducativoRol INT NOT NULL,
  IdRol INT NULL,
  IdCurso INT NULL,
  PRIMARY KEY (IdEnteEducativo, IdEnteEducativoRol),
 
  CONSTRAINT FK_IdEnt_edu
    FOREIGN KEY (IdEnteEducativo)
    REFERENCES EntesEducativos (IdEnteEducativo),
  
  CONSTRAINT FK_IdRol_ent
    FOREIGN KEY (IdRol)
    REFERENCES Rol (IdRol),
   
  CONSTRAINT Fk_Ent_curso
    FOREIGN KEY (IdCurso)
    REFERENCES curso (IdCurso));
    
 
 -- INSERT EnteEducativoRol
    
    
INSERT INTO EnteEducativoRol(IdEnteEducativo,IdEnteEducativoRol,IdRol,IdCurso) 
VALUES (1,1,1,1);


INSERT INTO EnteEducativoRol(IdEnteEducativo,IdEnteEducativoRol,IdRol,IdCurso) 
VALUES (2,2,1,2);



INSERT INTO EnteEducativoRol(IdEnteEducativo,IdEnteEducativoRol,IdRol,IdCurso) 
VALUES (3,3,1,3);
INSERT INTO EnteEducativoRol(IdEnteEducativo,IdEnteEducativoRol,IdRol,IdCurso) 
VALUES (4,4,1,4);







-- -----------------------------------------------------
-- Table `mydb`.`Rol`
-- -----------------------------------------------------
CREATE TABLE Rol (
  IdRol INT NOT NULL,
  NombreRol VARCHAR(100) NULL,
  Contraseña VARCHAR(100) NULL,
  
  PRIMARY KEY (IdRol));
  
  alter table Rol
  drop Contraseña;
 alter table Rol add CONSTRAINT FK_Rol_Admin
FOREIGN KEY (IdRol)
REFERENCES HorarioAdmin (IdRol);
  
 -- INSERT ROL 
  
INSERT INTO Rol(IdRol,NombreRol) 
VALUES ('1','Profesor');
INSERT INTO Rol(IdRol,NombreRol) 
VALUES ('12','Administrativo');
INSERT INTO Rol(IdRol,NombreRol) 
VALUES ('3','Directivo');
INSERT INTO Rol(IdRol,NombreRol) 
VALUES ('4','coordinador');
INSERT INTO Rol(IdRol,NombreRol) 
VALUES ('5','orientador');


-- -----------------------------------------------------
-- Table `webeducativa`.`curso`
-- -----------------------------------------------------
CREATE TABLE curso (
  IdCurso INT NOT NULL AUTO_INCREMENT,
  NombreCurso VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (IdCurso));

-- INSERTS CURSO
INSERT INTO curso (NombreCurso) 
VALUES ('1-1');
 INSERT INTO curso (NombreCurso) 
VALUES ('2-1');
INSERT INTO curso (NombreCurso) 
VALUES ('3-1');
INSERT INTO curso (NombreCurso) 
VALUES ('4-1');
INSERT INTO curso (NombreCurso) 
VALUES ('5-1');
INSERT INTO curso (NombreCurso) 
VALUES ('6-1');
INSERT INTO curso (NombreCurso) 
VALUES ('7-1');
INSERT INTO curso (NombreCurso) 
VALUES ('8-1');
INSERT INTO curso (NombreCurso) 
VALUES ('9-1');
INSERT INTO curso (NombreCurso) 
VALUES ('10-1');
INSERT INTO curso (NombreCurso) 
VALUES ('11-1');
 
select * from curso;
describe curso;
  
 


-- -----------------------------------------------------
-- Table `mydb`.`EnteEducativoRol`
-- -----------------------------------------------------


drop table EstudianteAcu;
-- ---------------------------------------------------
-- Table `webeducativa`.`EstudianteAcu`
-- -----------------------------------------------------
CREATE TABLE EstudianteAcu (
  CedulaPadre INT NOT NULL AUTO_INCREMENT,
  PrimerNombre VARCHAR(20) NULL DEFAULT NULL,
  SegundoNombre VARCHAR(20) NULL DEFAULT NULL,
  PirmerApellido VARCHAR(20) NULL DEFAULT NULL,
  SegundoApellido VARCHAR(20) NULL DEFAULT NULL,
  CorreoAcu VARCHAR(25) NULL DEFAULT NULL,
  celularAcu INT NULL DEFAULT NULL,
  TelTrabajo INT NULL DEFAULT NULL,
  direccion VARCHAR(55) NULL DEFAULT NULL,
  PRIMARY KEY (CedulaPadre));
  
  

 
  alter table EstudianteAcu
  modify celularAcu BIGINT NULL;
  alter table EstudianteAcu
  modify CorreoAcu varchar(500) NULL;
  alter table EstudianteAcu
  modify direccion varchar(500) NULL;
  
select * from estudiante;

-- -----------------------------------------------------
-- Table `webeducativa`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE estudiante (
  IdEstudiante INT NULL DEFAULT NULL,
  CodEstudiantil INT NOT NULL AUTO_INCREMENT,
  PrimerNombre VARCHAR(20) NULL DEFAULT NULL,
  SegundoNombre VARCHAR(20) NULL DEFAULT NULL,
  PirmerApellido VARCHAR(20) NULL DEFAULT NULL,
  SegundoApellido VARCHAR(20) NULL DEFAULT NULL,
  CorreoPersonal VARCHAR(25) NULL DEFAULT NULL,
  CorreoInstitucional VARCHAR(25) NULL DEFAULT NULL,
  celular INT NULL DEFAULT NULL,
  direccion VARCHAR(55) NULL DEFAULT NULL,
  fecha_Nac DATE NULL DEFAULT NULL,
  RH VARCHAR(8) NULL DEFAULT NULL,
  Eps VARCHAR(50) NULL DEFAULT NULL,
  Contraseña VARCHAR(100) NULL,
  PRIMARY KEY (CodEstudiantil),
  UNIQUE  UC_IdEstudiante (IdEstudiante));
  
alter table estudiante drop contraseña;  

select CodEstudiantil from estudiante;
-- INSERTS ESTUDIANTE


alter table estudiante
  modify celular BIGINT NULL;

alter table estudiante add foto varchar(5000);

  alter table estudiante
  modify CorreoPersonal VARCHAR(500) NULL DEFAULT NULL;
  alter table estudiante
  modify CorreoInstitucional VARCHAR(500) NULL DEFAULT NULL;  
CREATE TABLE estudianteAcuRol (
  CodEstudiantil INT not NULL,
  CedulaPadre INT not NULL,
  IdestudianteAcuRol INT NOT NULL,
  PRIMARY KEY (IdestudianteAcuRol),

  CONSTRAINT FK_Cedu_padre
    FOREIGN KEY (CedulaPadre)
    REFERENCES EstudianteAcu (CedulaPadre),
   
  CONSTRAINT Fk_Estu_rol
    FOREIGN KEY (CodEstudiantil)
    REFERENCES estudiante (CodEstudiantil));

alter table estudianteAcuRol
  drop IdEstudiante;




drop table profesor;
ALTER TABLE estudianteAcuRol DROP FOREIGN KEY Fk_Estu_rol;
-- -----------------------------------------------------
-- Table `webeducativa`.`profesor`
-- -----------------------------------------------------
CREATE TABLE profesor (
  IdProfesor INT NOT NULL AUTO_INCREMENT,
  cedulaProfesor INT NOT NULL ,
  CodEstudiantil INT NOT NULL,
  PrimerNombreProfesor VARCHAR(20) NOT NULL,
  SegundoNombreProfesor VARCHAR(20) NOT NULL,
  PirmerApellidoProfesor VARCHAR(20) NOT NULL,
  SegundoApellidoProfesor VARCHAR(20) NOT NULL,
  CorreoPersonal VARCHAR(25) NULL DEFAULT NULL,
  CorreoInstitucional VARCHAR(25) NOT NULL ,
  celular INT NOT NULL ,
  direccion VARCHAR(55) NOT NULL,
  fecha_Nac DATE NOT NULL,
  IdCurso INT NOT NULL,
  IdMateria INT NOT NULL,
  contraseña VARCHAR(100) NOT NULL,
  PRIMARY KEY (IdProfesor),
  UNIQUE  UC_cedulaProfesor (cedulaProfesor),
  UNIQUE  UC_IdMateria (IdMateria));

alter table profesor drop contraseña;  
alter table profesor
  drop cedulaProfesor;  

CREATE TABLE directivo (
  IdDirectivo INT NOT NULL AUTO_INCREMENT,
  CargoDir VARCHAR(50) NULL DEFAULT NULL,
  codigo INT NULL DEFAULT NULL,
  IdProfesor INT NULL DEFAULT NULL,
  CodEstudiantil INT NULL DEFAULT NULL,
  NombreDirectivo VARCHAR(50) NULL DEFAULT NULL,
  IdAdministrativo INT NULL DEFAULT NULL,
  PRIMARY KEY (IdDirectivo),
  UNIQUE  UC_IdAdministrativo_Dir (IdAdministrativo),
  CONSTRAINT FK_Dir_Prof
    FOREIGN KEY (IdProfesor)
    REFERENCES profesor (IdProfesor));   

CREATE TABLE matricula (
  IdMatricula INT NOT NULL,
  CodEstudiantil INT NULL DEFAULT NULL,
  CedulaPadre INT NULL DEFAULT NULL,
  FechaMatricula DATE NULL DEFAULT NULL,
  IdCurso INT NULL,
  PRIMARY KEY (IdMatricula),
  UNIQUE  UC_matricula_CodEstudiantil (CodEstudiantil ),
  CONSTRAINT FK_matricula_CodEst
    FOREIGN KEY (CodEstudiantil)
    REFERENCES estudiante (CodEstudiantil),
  CONSTRAINT FK_matri_idcur_cur
    FOREIGN KEY (IdCurso)
    REFERENCES curso (IdCurso));  

CREATE TABLE nota (
  IdNota INT NULL DEFAULT NULL,
  CodEstudiantil INT NULL DEFAULT NULL,
  IdProfesor INT NULL DEFAULT NULL,
  nota FLOAT NULL DEFAULT NULL,
  ObservacionDisciplina TEXT NULL DEFAULT NULL,
  FechaNota DATE NULL DEFAULT NULL,
  ObservacionNota TEXT NULL,
  CONSTRAINT FK_Nota_Estu
    FOREIGN KEY (CodEstudiantil)
    REFERENCES estudiante (CodEstudiantil),
  CONSTRAINT FK_Nota_materia
    FOREIGN KEY (IdNota)
    REFERENCES materia (IdNota),
  CONSTRAINT fk_nota_prof
    FOREIGN KEY (IdProfesor)
    REFERENCES profesor (IdProfesor));      
-- to show all tables
show tables;

-- to describe table
describe customer;


