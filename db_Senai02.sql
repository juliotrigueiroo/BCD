DROP DATABASE IF EXISTS db_senai;

CREATE DATABASE IF NOT EXISTS db_senai;

USE db_senai;

CREATE TABLE IF NOT EXISTS tb_curso (
id_curso INT PRIMARY KEY AUTO_INCREMENT,
nome_curso VARCHAR(30) NOT NULL UNIQUE,
carga_horaria INT UNSIGNED NOT NULL,
ano YEAR NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_aluno ( 
id_professor int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome varchar(30) NOT NULL,
nascimento date,
sexo enum('M','F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) DEFAULT 'Brasileira',
CURSOS_id_curso int,
FOREIGN KEY (CURSOS_id_curso) REFERENCES tb_curso(id_curso)
);

INSERT INTO tb_curso (nome_curso, carga_horaria, ano) VALUES
('Programação em Python', 120, 2023),
('Análise de Dados com SQL', 80, 2024),
('Design Gráfico', 150, 2023),
('Marketing Digital', 100, 2024),
('Administração de Empresas', 200, 2023),
('Engenharia de Software', 250, 2024),
('Ciência da Computação', 300, 2023),
('Direito', 180, 2024),
('Medicina', 400, 2023),
('Educação Física', 120, 2024);

INSERT INTO tb_aluno (nome, nascimento, sexo, peso, altura, nacionalidade, CURSOS_id_curso) VALUES
('João Silva', '1995-05-10', 'M', 75.50, 1.75, 'Brasileira', 1),
('Maria Oliveira', '1998-02-20', 'F', 60.20, 1.62, 'Brasileira', 2),
('Pedro Santos', '2000-08-15', 'M', 80.00, 1.80, 'Brasileira', 3),
('Ana Costa', '1997-11-25', 'F', 55.80, 1.65, 'Brasileira', 4),
('Carlos Ferreira', '2002-04-07', 'M', 72.30, 1.70, 'Brasileira', 5),
('Letícia Almeida', '1999-09-12', 'F', 62.10, 1.68, 'Brasileira', 6),
('Rafael Gomes', '2001-03-28', 'M', 78.40, 1.77, 'Brasileira', 7),
('Isabela Pereira', '1996-07-05', 'F', 58.90, 1.63, 'Brasileira', 8),
('Gustavo Santos', '2003-10-22', 'M', 70.60, 1.72, 'Brasileira', 9),
('Camila Oliveira', '2004-01-18', 'F', 57.30, 1.60, 'Brasileira', 10);