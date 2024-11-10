----- projeto 1 (Biblioteca)
---- criação da tabela Editora e inserção dos dados ----
create table EDITORA (
      IdEditora SERIAL PRIMARY KEY,
	  Nome varchar(30) not null,
	  constraint un_nome_ED unique (Nome)
);
select * from editora;
insert into EDITORA (Nome) values ('Bookman');
insert into EDITORA (Nome) values ('Edgar Blusher');
insert into EDITORA (Nome) values ('Nova Terra');
insert into EDITORA (Nome) values ('Brasport');
-------------------------------
------- criação da tabela CATEGORIA e inserção dos dados ----
create table CATEGORIA (
        IdCategoria Serial PRIMARY KEY,
		Nome varchar(30) not null,
		constraint un_nome_CAT unique (Nome)
);

select * from categoria;
insert into categoria (nome) values ('Banco de dados');
insert into categoria (nome) values ('HTML');
insert into categoria (nome) values ('Java');
insert into categoria (nome) values ('PHP');
-----------------------------------------------
------ criação da tabela AUTOR e inserção dos dados ----
create table autor (
		IdAutor serial primary key,
		nome varchar(30) not null
);

select * from autor;
insert into autor (nome) values ('Waldemar Setzer');
insert into autor (nome) values ('Flávio Soares');
insert into autor (nome) values ('John Watson');
insert into autor (nome) values ('Rui Rossi dos Santos');
insert into autor (nome) values ('Antonio Pereira de Resende');
insert into autor (nome) values ('Claudiney Calixto Lima');
insert into autor (nome) values ('Evandro Carlos Teruel');
insert into autor (nome) values ('Ian Graham');
insert into autor (nome) values ('Fabrício Xavier');
insert into autor (nome) values ('Pablo Dalloglio');
-----------------------------------------------------------------
------ criação da tabela livro e inserção dos dados
create table livro (
      IdLivro serial primary key,
	  IdEditora integer not null,
	  IdCategoria integer not null,
	  nome varchar(100) not null,
	  constraint fk_livro_Ideditora foreign key(IdEditora) references editora (IdEditora),
	  constraint fk_livro_IdCategoria foreign key(IdCategoria) references categoria (IdCategoria)
);

select * from livro;
insert into livro (IdEditora,IdCategoria,nome) values (2,1,'Banco de Dados - 1 Edição');
insert into livro (IdEditora,IdCategoria,nome) values (1,1,'Oracle DataBase 11G Administração');
insert into livro (IdEditora,IdCategoria,nome) values (3,3,'Programação de Computadores em Java');
insert into livro (IdEditora,IdCategoria,nome) values (4,3,'Programação Orientada a Aspectos em Java');
insert into livro (IdEditora,IdCategoria,nome) values (4,2,'HTML5 - Guia Prático');
insert into livro (IdEditora,IdCategoria,nome) values (3,2,'XHTML: Guia de Referência para Desenvolvimento na Web');
insert into livro (IdEditora,IdCategoria,nome) values (1,4,'PHP para Desenvolvimento Profissional');
insert into livro (IdEditora,IdCategoria,nome) values (2,4,'PHP com Programação Orientada a Objetos');
_______________________________________________________________________________________________________
---------- criação da tabela livro_autor e inserção de dados 
create table livro_autor (
         IdLivro integer not null,
		 IdAutor integer not null,
		 constraint fk_livro_autor_IdLivro foreign key (IdLivro) references livro (IdLivro),
		 constraint fk_autor_IdAutor foreign key (IdAutor) references autor (IdAutor)		 
);
alter table livro_autor add primary key (IdLivro,IdAutor);
select * from livro_autor;
insert into livro_autor (IdLivro,IdAutor) values (1,1);
insert into livro_autor (IdLivro,IdAutor) values (1,2);
insert into livro_autor (IdLivro,IdAutor) values (2,3);
insert into livro_autor (IdLivro,IdAutor) values (3,4);
insert into livro_autor (IdLivro,IdAutor) values (4,5);
insert into livro_autor (IdLivro,IdAutor) values (4,6);
insert into livro_autor (IdLivro,IdAutor) values (5,7);
insert into livro_autor (IdLivro,IdAutor) values (6,8);
insert into livro_autor (IdLivro,IdAutor) values (7,9);
insert into livro_autor (IdLivro,IdAutor) values (8,10);
--------------------------------------------------------------
----------- criação da tabela aluno e inserção de dados
create table aluno(
         IdAluno serial primary key,
		 nome varchar(30) not null 
);
select * from aluno;
insert into aluno (nome) values ('Mario');
insert into aluno (nome) values ('João');
insert into aluno (nome) values ('Paulo');
insert into aluno (nome) values ('Pedro');
insert into aluno (nome) values ('Maria');
--------------------------------------------------------------
-------------- criação emprestimos e inserção de dados
create table emprestimo(
        IdEmprestimo serial primary key,
		IdAluno integer not null,
		data_emprestimo date not null default current_date,
		data_devolucao date not null,
		valor numeric(10,2) not null ,
		devolvido char(1) not null,
		constraint fk_emprestimo_idaluno foreign key (IdAluno) references aluno (IdAluno)
);
alter table emprestimo alter column valor set default 0;

select * from emprestimo;
insert into emprestimo (IdAluno,data_emprestimo,data_devolucao,valor,devolvido) values (1,'02/05/2012','12/05/2012',10.00,'S');
insert into emprestimo (IdAluno,data_emprestimo,data_devolucao,valor,devolvido) values (1,'23/04/2012','03/05/2012',5.00,'N');
insert into emprestimo (IdAluno,data_emprestimo,data_devolucao,valor,devolvido) values (2,'10/05/2012','20/05/2012',12.00,'N');
insert into emprestimo (IdAluno,data_emprestimo,data_devolucao,valor,devolvido) values (3,'10/05/2012','20/05/2012',8.00,'S');
insert into emprestimo (IdAluno,data_emprestimo,data_devolucao,valor,devolvido) values (4,'05/05/2012','15/05/2012',15.00,'N');
insert into emprestimo (IdAluno,data_emprestimo,data_devolucao,valor,devolvido) values (4,'07/05/2012','17/05/2012',20.00,'S');
insert into emprestimo (IdAluno,data_emprestimo,data_devolucao,valor,devolvido) values (4,'08/05/2012','18/05/2012',5.00,'S');
--------------------------------------------------------------------------------------------------------------------------------
------------------ criação da tabela emprestimo_livro e inserção de dados -------
create table emprestimo_livro (
            IdEmprestimo integer not null,
			IdLivro integer not null,
			constraint fk_emprestimo_livro_IdEmprestimo foreign key (IdEmprestimo) references emprestimo (IdEmprestimo),
			constraint fk_emprestimo_livro_IdLivro foreign key (IdLivro) references livro (IdLivro),
			primary key (IdEmprestimo, IdLivro)					
);
select * from emprestimo_livro;
insert into emprestimo_livro values (1,1);
insert into emprestimo_livro values (2,4);
insert into emprestimo_livro values (2,3);
insert into emprestimo_livro values (3,2);
insert into emprestimo_livro values (3,7);
insert into emprestimo_livro values (4,5);
insert into emprestimo_livro values (5,4);
insert into emprestimo_livro values (6,6);
insert into emprestimo_livro values (7,8);
---------------------------------------------------------------------------------
------------- criação de índices para tabela empréstimos
select * from emprestimo;
create index idx_emprestimo_data_emprestimo on emprestimo(data_emprestimo);
create index idx_emprestimo_data_devolucao on emprestimo(data_devolucao);
-----------------------------------------------------------------------------------
----------- consultas simples
------------- exercício número 1
select * from autor;
select nome as autores from autor order by nome asc;
-------------------------------------------------------------------------------
------------ exercício número 2
select * from aluno order by nome;
select nome from aluno where nome like 'P%';
---------------------------------------------------------------------------------
------------- exercício número 3
select * from livro;
select * from categoria;
select nome from livro where idcategoria = 1 or idcategoria = 3;
--------------------------------------------------------------------------------
------------- exercício número 4
select * from livro;
select * from editora;
select nome from livro where ideditora = 1;
-------------------------------------------------------------------------
------------- exercício número 5
select * from emprestimo where '2012-05-05' <= data_emprestimo and data_emprestimo <= '2012-05-10'
order by 3 asc;
select * from emprestimo where data_emprestimo between '2012-05-05' and '2012-05-10' order by 3 asc;
---------------------------------------------------------------------------------------------
------------ exercício número 6
select * from emprestimo order by 3;
select * from emprestimo where not ('2012-05-05' <= data_emprestimo and data_emprestimo <= '2012-05-10')
order by 3 asc;
select * from emprestimo where not (data_emprestimo between '2012-05-05' and '2012-05-10') order by 3 asc;
--------------------------------------------------------------------------
------------ exercício número 7
select * from emprestimo;
select * from emprestimo where devolvido = 'S';
select * from emprestimo where not devolvido = 'N';
--------------------------------------------------------------------------------------
--------------- consultas com agrupamento simples
--------------- exercício número 1
select count(idlivro) as quantidade_de_livros from livro;
-------------------------------
--------------- exercício número 2
select sum(valor) as valor_total_dos_emprestimos from emprestimo;
-------------------------------------------------------------------------
--------------- exercício número 3
select round(avg(valor),2) as media_valor_dos_emprestimos from emprestimo;
----------------------------------------------------------------------------
---------------- exercício número 4
select max(valor) as maior_valor_dos_emprestimos from emprestimo;
---------------------------------------------------------------------------
---------------- exercício número 5
select min(valor) as menor_valor_dos_emprestimos from emprestimo;
---------------------------------------------------------------------------
---------------- exercício número 6
select sum(valor) as total_valor_dos_emprestimo from emprestimo
where data_emprestimo between '2012-05-05' and '2012-05-10';
--------------------------------------------------------------------------
select sum(valor) as total_valor_dos_emprestimo from emprestimo
where '2012-05-05' <= data_emprestimo and data_emprestimo <= '2012-05-10';
--------------------------------------------------------------------------
---------------- exercício número 7
select count(*) as quantidade_de_emprestimos from emprestimo
where data_emprestimo between '2012-05-01' and '2012-05-05';
---------------------------------------------------------------------------
select count(idemprestimo) as quantidade_de_emprestimos from emprestimo
where '2012-05-01' <= data_emprestimo and data_emprestimo <= '2012-05-05';
----------------------------------------------------------------------------
------------------ consultas com join -------------
--------------------------------------------------------------------------
------------------ exercício número 1
select * from livro;
select * from categoria;
select * from editora;
create view consulta_livro_categoria_editora as
select liv.nome as nome_livro, cat.nome as categoria, edi.nome as editora from livro liv
left outer join categoria cat on liv.idcategoria = cat.idcategoria left outer join editora edi
on liv.ideditora = edi.ideditora order by 1;

select * from consulta_livro_categoria_editora;
---------------------------------------------------------------------------
----------------- exercício número 2
select * from livro;
select * from autor;
select * from livro_autor;
create view consulta_livro_autor as
select liv.nome as nome_livro, aut.nome as autor_ou_autores from livro liv 
left outer join livro_autor liv_aut on liv.idlivro = liv_aut.idlivro
left outer join autor aut on aut.idautor = liv_aut.idautor;

select * from consulta_livro_autor;
----------------------------------------------------------------------------
----------------- exercício número 3
select nome_livro from consulta_livro_autor where autor_ou_autores = 'Ian Graham';
------------------------------------------------------------------------------
----------------- exercício número 4
select * from livro;
select * from emprestimo_livro;
select * from emprestimo;
select liv.nome as nome_livro, emp.data_emprestimo, emp.data_devolucao from livro liv
left outer join emprestimo_livro emp_liv on liv.idlivro = emp_liv.idlivro 
left outer join emprestimo emp on emp_liv.idemprestimo = emp.idemprestimo;
-----------------------------------------------------------------------------------
----------------- exercício número 5
select * from livro;
select * from emprestimo_livro;
select liv.nome as livros_emprestados from emprestimo_livro as emp_liv 
left outer join livro liv on emp_liv.idlivro = liv.idlivro;
----------------------------------------------------------------------------------
------------------ consulta agrupamento + join
------------------- exercício número 1 
select * from editora;
select * from livro order by 2;
select edi.nome as editora, count(liv.idlivro) as quantidade from editora edi left outer join livro liv on 
edi.ideditora = liv.ideditora group by edi.nome;
---------------------------------------------------------------------------------
-------------------- exercício número 2
select * from categoria;
select * from livro order by 3;
select cat.nome as categoria, count(liv.idlivro) as quantidade from categoria cat 
left outer join livro liv on cat.idcategoria = liv.idcategoria group by cat.nome;
---------------------------------------------------------------------------------------
-------------------- exercício número 3
select * from autor;
select * from livro_autor;
select aut.nome as autor, count(liv_aut.idlivro) as quantidade_livros from autor aut
left outer join livro_autor liv_aut on aut.idautor = liv_aut.idautor group by aut.nome;
----------------------------------------------------------------------------------------
-------------------- exercício número 4
select * from aluno;
select * from emprestimo;
select alu.nome as aluno, count(emp.idemprestimo) as quant_de_emprestimo from aluno alu
left outer join emprestimo emp on alu.idaluno = emp.idaluno group by alu.nome order by 2 asc;
----------------------------------------------------------------------------------------
-------------------- exercício número 5
select * from aluno;
select * from emprestimo where idaluno;
select alu.nome as aluno, sum(emp.valor) as valor_total from aluno alu
left outer join emprestimo emp on alu.idaluno = emp.idaluno group by alu.nome order by 2 asc;
------------------------------------------------------------------------------------------
-------------------- exercício número 6
select * from aluno;
select * from emprestimo;
select alu.nome as aluno, sum(emp.valor) as valor_total from aluno alu
left outer join emprestimo emp on alu.idaluno = emp.idaluno group by alu.nome 
having sum(emp.valor) > 7.00 order by 2 asc;
--------------------------------------------------------------------------------------------
---------------- Consultas comandos diversos
------------------------------------------------------------------------------------------
------------------- exercício número 1
select * from aluno;
select upper(nome) as nome_dos_alunos from aluno order by nome asc;
------------------------------------------------------------------------------------------
------------------- exercício número 2
select * from emprestimo order by 3;
select * from emprestimo emp where extract(month from emp.data_emprestimo) = 04;
------------------------------------------------------------------------------------------
------------------- exercício número 3
select *,
	case 
		when devolvido = 'S' then 'Devolução completa.'
		else 'Em atraso.'
	end status
from emprestimo;

select *,
	case devolvido
	     when 'S' then 'Devolução completa.'
		 else 'Em atraso.'
	end status
from emprestimo;
-----------------------------------------------------------------------------
----------- exercício número 4
select * from autor;
select substring(nome from 5 for 6) as extrado_autor from autor;
-----------------------------------------------------------------------------
----------- exercício número 5
select * from emprestimo;
select valor as valor_emprestimo, 
           case extract(month from data_emprestimo) 
		   	   when 01 then 'Janeiro'
			   when 02 then 'Fevereiro'
			   when 03 then 'Março'
			   when 04 then 'Abril'
			   when 05 then 'Maio'
			   when 06 then 'Junho'
			   when 07 then 'Julho'
			   when 08 then 'Agosto'
			   when 09 then 'Setembro'
			   when 10 then 'Outubro'
			   when 11 then 'Novembro'
		       else 'Dezembro'
		   end mes_do_emprestimo
from emprestimo order by 2;

SELECT valor AS valor_emprestimo,
       TO_CHAR(data_emprestimo, 'TMMonth') AS mes_do_emprestimo
FROM emprestimo
ORDER BY mes_do_emprestimo;
-----------------------------------------------------------------------------------
---------------------- subconsultas
------------------------------------------------------
----------------- exercício número 1
select 
        data_emprestimo,
		valor as valor_emprestimo_maior_media
from emprestimo where valor > (select avg(valor) from emprestimo);
---------------------------------------------------------------------------
----------------- exercício número 2
select
		emp.data_emprestimo,
		valor as valor_emprestimo
from emprestimo emp inner join (select idemprestimo, count(idlivro) from emprestimo_livro 
group by idemprestimo having count(idlivro) > 1) as el on emp.idemprestimo = el.idemprestimo;
-----------------------------------------------------------------------------
-------------------- exercício número 3
select * from emprestimo;
select avg(valor) from emprestimo;
select 
		emp.data_emprestimo,
		emp.valor as valor_emprestimo_menor_media
from emprestimo emp where (select avg(valor) from emprestimo emp) > emp.valor; 
---------------------------------------------------------------------------------