#CRIAR UMA BASE DE DADOS
CREATE SCHEMA clientes_servicos;
#CRIAR BASE DE DADOS PELA INTERFACE DO WORKBENCH: BOTÃO DIREITO DO MOUSE EM SCHEMAS > CREATE SCHEMA
#APAGAR ESQUEMA
DROP SCHEMA clientes_servicos;

-- -- -- -- -- -- 
#CRIAR TABELAS PELA INTERFACE: abre o banco > botão direito em Tables > create Table
#NOT NULL -> campo obrigatório
#AUTO_INCREMENT -> auto incrementar, pula sozinho de codigo

#criar tabela alunos no banco banco_teste
-- as aspas dupla `` não é obrigatório
CREATE TABLE `banco_teste`.`alunos` (
  `id_aluno` int NOT NULL,
  PRIMARY KEY (`id_aluno`)
) ;
#criar tabela cursos no banco banco_teste
CREATE TABLE banco_teste.cursos (
  id_curso int NOT NULL,
  PRIMARY KEY (id_curso)
) ;

#criar tabela notas
CREATE TABLE banco_teste.notas(
id_nota INT NOT NULL,
PRIMARY KEY (id_nota)
);

-- -- -- -- -- -- --
#CRIAR NOVOS CAMPOS, ALTERAR TABELA (ALTER TABLE)
-- pela interface: procura a tabela > botao direito > alter table
-- inserindo colunas na tabela alunos, quais campos vai ter nessa tabela
ALTER TABLE alunos
ADD COLUMN `nome` VARCHAR(90) NOT NULL AFTER `id_aluno`,
ADD COLUMN `data_nascimento` DATE NOT NULL AFTER `nome`,
ADD COLUMN `endereco` VARCHAR(200) NOT NULL AFTER `data_nascimento`,
ADD COLUMN `cidade` VARCHAR(45) NOT NULL AFTER `endereco`,
ADD COLUMN `estado` CHAR(2) NOT NULL AFTER `cidade`;

#ALTERAR TABELA CURSOS
ALTER TABLE cursos
ADD COLUMN nome VARCHAR (100) NOT NULL AFTER `id_curso`;

#ALTERAR TABELA NOTAS
ALTER TABLE notas
ADD COLUMN descricao_atividade VARCHAR(100) not null after `id_nota`,
ADD COLUMN `valor_nota` DECIMAL (5,2) NOT NULL AFTER `descricao_atividade`; -- 5 digitos e depois da virgula, tem 2 digitos , ex: (100,00) (0,00)

-- -- -- -- -- -- -- -- -- 
#APAGAR ELEMENTOS 

#apagar tabela 
DROP TABLE alunos;

#apagar base de dados, banco de dados
DROP DATABASE banco_teste;

#FAZER BACKUP: BOTÃO DIREITO NA TELA > SENDO TO SQL EDITOR > CREATE STATEMENT
CREATE TABLE `alunos` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(90) NOT NULL,
  `data_nascimento` date NOT NULL,
  `endereco` varchar(200),
  `cidade` varchar(45),
  `estado` char(2),
  PRIMARY KEY (`id_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -- -- -- -- -- -- -- -- -- -- 
#INSERIR DADOS NUMA TABELA, POVOAR ELA, INSERIR DADOS/PESSOAS

-- inserir dados em colunas específicas, tem que específicar as colunas
INSERT INTO alunos (nome, data_nascimento, endereco)
VALUES ('Felipe Lullio', '1997-09-22', 'av xxx');

-- inserir dados em todas as colunas, nao precisa especificar as colunas, colocar VALEUS direto
INSERT INTO alunos
VALUES (DEFAULT, 'FELIPE', '1990-09-04', 'AV ALDA XX', 'diadema', 'sp');

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
#ALTERAR DADOS DE UMA TABELA, os campos da tabela, pessoas
SELECT * FROM alunos;
UPDATE alunos
SET nome = "felipe gomes lullio"
WHERE id_aluno = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- 
#DELETAR DADOS DE UMA TABELA
SELECT * FROM alunos;
DELETE FROM alunos
WHERE id_aluno = 1;

-- -- -- -- -- -- -- -- -- -- -- -- -- --
#FAZER CONSULTAR, SELECT
-- pela interface, botão direito na tabela, select rows limit 1000

SELECT * FROM alunos;

-- CAMPOS ESPECIFICOS, NUMA ORDEM ESPECIFICA
SELECT district, population, countrycode #colunas
FROM world.city #tabela city do banco de dados world
WHERE population > 90000 #condicao
ORDER BY Population; #ordenar pela população, ordem crescente, caso queira ordem descrecente basta colocar 'DESC'
# ORDER BY 3 DESC  -> vai ordenar pelo terceiro campo, o countrycode, de forma descrescente;

-- OPERADORES LÓGICOS E RELACIONAIS

#satisfaz uma condicao ou outra, uma das duas
SELECT * FROM alunos
WHERE id_aluno = 2 or id_aluno= 3;
#satisfaz duas condicoes, duas condicoes verdadeiras
SELECT * FROM alunos
WHERE cidade ="sao paulo" and estado ='sp';

SELECT * FROM alunos
WHERE data_nascimento > '1990-01-01' #todo mundo que tem mais do que essa data
#WHERE data_nascimento <> '1990-01-01' #diferente
