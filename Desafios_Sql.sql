CREATE DATABASE Desafios_Sql;

USE Desafios_Sql;

-- DESAFIO 1

CREATE TABLE Clientes(
Id_Cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome VARCHAR(100) NOT NULL,
Email VARCHAR(200) NOT NULL,
Cidade VARCHAR(100) NOT NULL
);

SELECT * FROM Clientes WHERE Cidade ='São Paulo';

-- DESAFIO 2
CREATE TABLE Pedidos(
  Id_Pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Id_Cliente INT NOT NULL,
  FOREIGN KEY(Id_Cliente) REFERENCES Cliente(Id_Cliente),
  Data DATETIME NOT NULL,
  Valor DECIMAL(10, 2) NOT NULL
);

SELECT Id_Cliente, COUNT(*) AS Todos_Pedidos
FROM Pedidos
GROUP BY Id_Cliente;

-- DESAFIO 3

CREATE TABLE Produtos(
  Id_Produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Nome VARCHAR(100) NOT NULL,
  Preco DECIMAL(10, 2) NOT NULL, 
  Categoria VARCHAR(100) NOT NULL
);

SELECT Id_Produto, Nome, Preco AS Valor_Maior_100
FROM Produtos
WHERE Preco > 100
GROUP BY Id_Produto;

-- DESAFIO 4

SELECT c.Nome, p.Valor
FROM Clientes c
JOIN Pedidos p ON c.Id_Cliente = p.Id_Cliente;


-- DESAFIO 5

CREATE TABLE Vendas(
Id_Venda INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  
Id_Produto INT NOT NULL,
FOREIGN KEY(Id_Produto) REFERENCES Produtos(Id_Produto),
Valor DECIMAL(10, 2) NOT NULL,
Quantidade INT NOT NULL
);

SELECT v.Id_Produto, SUM(v.Quantidade) AS Total_Vendido
FROM Vendas v
GROUP BY v.Id_Produto;

-- DESAFIO 6 

CREATE TABLE Funcionarios(
Id_Funcionario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  
Nome VARCHAR(100) NOT NULL,
SALARIO DECIMAL(10, 2) NOT NULL
);

SELECT Id_Funcionario, Nome
FROM Funcionarios
WHERE Salario > (SELECT AVG(Salario) FROM Funcionarios);
-- Utilizando uma subconsulta


-- DESAFIO 7

CREATE TABLE Estoque(
Id_Estoque INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  
Id_Produto INT NOT NULL,
FOREIGN KEY(Id_Produto) REFERENCES Produtos(Id_Produto),
Quantidade INT NOT NULL 
  );

UPDATE Estoque SET Quantidade = Quantidade + 10 WHERE Id_Produto = 1;

