CREATE DATABASE livraria;

CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL
);


CREATE TABLE autor (
    id_autor SERIAL PRIMARY KEY,
    nome_autor VARCHAR(200) NOT NULL
);


CREATE TABLE livro (
    id_livro SERIAL PRIMARY KEY,
    titulo_livro VARCHAR(200) NOT NULL,
    ano_publicacao INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);


CREATE TABLE exemplar (
    id_exemplar SERIAL PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    id_livro INT,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);


CREATE TABLE leitor (
    id_leitor SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(200) NOT NULL
);

CREATE TABLE emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    id_leitor INT,
    id_exemplar INT,
    FOREIGN KEY (id_leitor) REFERENCES leitor(id_leitor),
    FOREIGN KEY (id_exemplar) REFERENCES exemplar(id_exemplar)
);

CREATE TABLE livro_autor (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);