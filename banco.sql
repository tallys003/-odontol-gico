CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE dentistas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cro VARCHAR(20) NOT NULL UNIQUE,
    especialidade VARCHAR(50) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    dentista_id INT NOT NULL,
    FOREIGN KEY (dentista_id) REFERENCES dentistas(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE agendamentos (
    id SERIAL PRIMARY KEY,
    data_agendamento TIMESTAMP NOT NULL,
    cliente_id INT NOT NULL,
    dentista_id INT NOT NULL,
    observacao VARCHAR(255),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (dentista_id) REFERENCES dentistas(id) ON DELETE CASCADE ON UPDATE CASCADE
);