create database petshop1;
use petshop1;

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    cpf VARCHAR(14),
    endereco VARCHAR(255)
);

CREATE TABLE Animais (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    raca VARCHAR(50),
    porte VARCHAR(20),
    especie VARCHAR(50),
    sexo CHAR(1),
    idade INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10,2),
    estoque INT
);

CREATE TABLE Loja (
    id_loja INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(18),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cargo VARCHAR(50)
);

CREATE TABLE Atendimento (
    id_atendimento INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    hora TIME,
    id_cliente INT,
    id_funcionario INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);

CREATE TABLE Servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    valor DECIMAL(10,2),
    descricao TEXT
);

CREATE TABLE Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    dat DATE,
    valor_total DECIMAL(10,2),
    id_loja INT,
    FOREIGN KEY (id_loja) REFERENCES Loja(id_loja)
);

CREATE TABLE Oferece (
    id_loja INT,
    id_produto INT,
    PRIMARY KEY (id_loja, id_produto),
    FOREIGN KEY (id_loja) REFERENCES Loja(id_loja),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Venda_Servico (
    id_venda INT,
    id_servico INT,
    PRIMARY KEY (id_venda, id_servico),
    FOREIGN KEY (id_venda) REFERENCES Vendas(id_venda),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);



INSERT INTO Cliente (nome, telefone, cpf, endereco) VALUES
('Ana Silva', '69992658478', '123.456.789-00', 'Rua das Flores, 123'),
('Bruno Costa', '69992465692', '234.567.890-11', 'Av. Brasil, 456'),
('Carlos Souza', '69992102378', '345.678.901-22', 'Rua JK, 789'),
('Daniela Lima', '69992559665', '456.789.012-33', 'Rua Monte Negro, 101'),
('Eduardo Alves', '69992462923', '567.890.123-44', 'Rua Amazona, 202'),
('Fernanda Rocha', '69992462701', '678.901.234-55', 'Rua Liberdade, 303'),
('Gabriela Dias', '69992603238', '789.012.345-66', 'Av. Monte Castelo, 404'),
('Henrique Melo', '11999990008', '890.123.456-77', 'Rua Fonseca, 505'),
('Isabela Nunes', '11999997809', '901.234.567-88', 'Rua Gentúlio Vargas, 606'),
('João Pedro', '11999690010', '012.345.678-99', 'Rua Princesa Izabel, 707');


INSERT INTO Animais (nome, raca, porte, especie, sexo, idade, id_cliente) VALUES
('Rex', 'Labrador', 'Grande', 'Cão', 'M', 5, 1),
('Mia', 'Siamês', 'Pequeno', 'Gato', 'F', 3, 2),
('Thor', 'Bulldog', 'Médio', 'Cão', 'M', 4, 3),
('Luna', 'Persa', 'Pequeno', 'Gato', 'F', 2, 4),
('Bento', 'Poodle', 'Pequeno', 'Cão', 'M', 6, 5),
('Nina', 'SRD', 'Médio', 'Gato', 'F', 1, 6),
('Max', 'Golden Retriever', 'Grande', 'Cão', 'M', 7, 7),
('Mel', 'Vira-lata', 'Pequeno', 'Gato', 'F', 4, 8),
('Zeca', 'Beagle', 'Médio', 'Cão', 'M', 3, 9),
('Lili', 'Angorá', 'Pequeno', 'Gato', 'F', 2, 10);


INSERT INTO Produto (nome, categoria, preco, estoque) VALUES
('Ração Premium', 'Alimentação', 89.90, 50),
('Shampoo Pet', 'Higiene', 25.50, 30),
('Brinquedo Bola', 'Brinquedos', 15.00, 100),
('Coleira Simples', 'Acessórios', 18.90, 40),
('Ração Gato', 'Alimentação', 79.90, 60),
('Petisco Cão', 'Alimentação', 12.50, 80),
('Areia Higiênica', 'Higiene', 20.00, 25),
('Arranhador', 'Brinquedos', 45.00, 15),
('Cama Pet', 'Acessórios', 110.00, 20),
('Roupa Inverno', 'Acessórios', 55.00, 10);


INSERT INTO Loja (cnpj, endereco, telefone) VALUES
('08.569.524/0001-01', 'Rua Central, 100', '69992890001'),
('06.235.045/0001-02', 'Av. Norte, 200', '69992700002'),
('04.674.102/0001-03', 'Rua Sul, 300', '69992560003'),
('05.259.356/0001-04', 'Rua Leste, 400', '69992860004'),
('06.029.895/0001-05', 'Av. Oeste, 500', '69992360005'),
('03.156.945/0001-06', 'Rua Alfa, 600', '69992450006'),
('02.089.020/0001-07', 'Rua Beta, 700', '69992120007'),
('01.074.120/0001-08', 'Rua Gama, 800', '69992100008'),
('13.033.049/0001-09', 'Rua Delta, 900', '69992120009'),
('11.129.023/0001-10', 'Av. Epsilon, 1000', '69992780010');


INSERT INTO Funcionario (nome, telefone, email, cargo) VALUES
('Carlos Mendes', '69988880001', 'carlos@empresa.com', 'Veterinário'),
('Paula Souza', '69988880002', 'paula@empresa.com', 'Atendente'),
('Renato Lima', '69988880003', 'renato@empresa.com', 'Banho e Tosa'),
('Juliana Costa', '69988880004', 'juliana@empresa.com', 'Gerente'),
('Tiago Reis', '69988880005', 'tiago@empresa.com', 'Veterinário'),
('Larissa Dias', '69988880006', 'larissa@empresa.com', 'Estagiária'),
('Bruno Alves', '69988880007', 'bruno@empresa.com', 'Auxiliar'),
('Marina Rocha', '69988880008', 'marina@empresa.com', 'Atendente'),
('Leandro Silva', '69988880009', 'leandro@empresa.com', 'Banho e Tosa'),
('Amanda Melo', '69988880010', 'amanda@empresa.com', 'Gerente');


INSERT INTO Atendimento (data, hora, id_cliente, id_funcionario) VALUES
('2025-07-01', '09:00:00', 1, 1),
('2025-07-02', '10:30:00', 2, 2),
('2025-07-03', '14:00:00', 3, 3),
('2025-07-04', '11:15:00', 4, 4),
('2025-07-05', '16:00:00', 5, 5),
('2025-07-06', '13:30:00', 6, 6),
('2025-07-07', '15:45:00', 7, 7),
('2025-07-08', '08:30:00', 8, 8),
('2025-07-09', '09:15:00', 9, 9),
('2025-07-10', '10:00:00', 10, 10);


INSERT INTO Servico (tipo, valor, descricao) VALUES
('Banho', 40.00, 'Banho com produtos neutros'),
('Tosa', 50.00, 'Tosa higiênica completa'),
('Consulta', 120.00, 'Consulta veterinária geral'),
('Vacinação', 90.00, 'Vacina múltipla'),
('Exame', 200.00, 'Exames laboratoriais básicos'),
('Hospedagem', 150.00, 'Diária para cães/gatos'),
('Adestramento', 300.00, 'Curso básico de obediência'),
('Transporte', 70.00, 'Transporte porta-a-porta'),
('Terapia', 250.00, 'Terapia comportamental animal'),
('Urgência', 500.00, 'Atendimento de emergência 24h');


INSERT INTO Vendas (dat, valor_total, id_loja) VALUES
('2025-07-01', 200.00, 1),
('2025-07-02', 150.00, 2),
('2025-07-03', 300.00, 3),
('2025-07-04', 180.00, 4),
('2025-07-05', 210.00, 5),
('2025-07-06', 400.00, 6),
('2025-07-07', 120.00, 7),
('2025-07-08', 350.00, 8),
('2025-07-09', 275.00, 9),
('2025-07-10', 310.00, 10);


INSERT INTO Oferece (id_loja, id_produto) VALUES
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5),
(3, 6), (4, 7), (5, 8), (6, 9), (7, 10);

-- Mostra apenas os clientes que possuem animais cadastrados.
SELECT c.nome AS cliente, a.nome AS animal, a.especie
FROM Cliente c
INNER JOIN Animais a ON c.id_cliente = a.id_cliente;

-- Mostra todos os clientes, mesmo os que nunca fizeram atendimentos.
SELECT c.nome AS cliente, a.data AS data_atendimento, f.nome AS funcionario
FROM Cliente c
LEFT JOIN Atendimento a ON c.id_cliente = a.id_cliente
LEFT JOIN Funcionario f ON a.id_funcionario = f.id_funcionario;

-- Mostra todas as lojas e os produtos que oferecem (ou NULL se não houver produtos cadastrados no relacionamento).
SELECT l.endereco AS loja, p.nome AS produto
FROM Produto p
RIGHT JOIN Oferece o ON p.id_produto = o.id_produto
RIGHT JOIN Loja l ON o.id_loja = l.id_loja;

-- 1. Clientes que fizeram atendimento com o funcionário 'Carlos Mendes'
SELECT nome
FROM Cliente
WHERE id_cliente IN (
    SELECT id_cliente
    FROM Atendimento
    WHERE id_funcionario = (
        SELECT id_funcionario
        FROM Funcionario
        WHERE nome = 'Carlos Mendes'
    )
);

-- 2. Produtos com preço maior que a média de todos os produtos
SELECT nome, preco
FROM Produto
WHERE preco > (
    SELECT AVG(preco)
    FROM Produto
);


-- 1. Quantidade de animais por espécie
SELECT especie, COUNT(*) AS total
FROM Animais
GROUP BY especie;



