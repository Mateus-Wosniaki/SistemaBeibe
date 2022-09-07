CREATE TABLE public.Categoria (
  idCategoria SERIAL PRIMARY KEY,
  nomeCategoria VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE public.Produto (
  idProduto SERIAL PRIMARY KEY,
  tituloProduto VARCHAR(128) UNIQUE NOT NULL,
  descricaoProduto VARCHAR(250),
  pesoProduto DECIMAL(5,2) DEFAULT 0.0,
  idCategoria INT,
  FOREIGN KEY (idCategoria) REFERENCES public.Categoria(idCategoria)
);

CREATE TABLE public.Funcao (
  idFuncao SERIAL PRIMARY KEY,
  descFuncao VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE public.TipoAtendimento (
  idTipoAtendimento SERIAL PRIMARY KEY,
  descTipoAtendimento VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE public.Situacao (
  idSituacao SERIAL PRIMARY KEY,
  descSituacao VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE public.Estado (
  idEstado SERIAL PRIMARY KEY,
  nomeEstado VARCHAR(50) UNIQUE NOT NULL,
  siglaUF CHAR(2) UNIQUE
);

CREATE TABLE public.Municipio (
  idMunicipio SERIAL PRIMARY KEY,
  nomeMunicipio VARCHAR(128) NOT NULL,
  idEstado INT,
  FOREIGN KEY (idEstado) REFERENCES public.Estado(idEstado)
);

CREATE TABLE public.Endereco (
  idEndereco SERIAL PRIMARY KEY,
  CEP CHAR(8) NOT NULL,
  logradouro VARCHAR(128) NOT NULL,
  numero INT,
  complemento VARCHAR(30),
  idMunicipio INT,
  FOREIGN KEY (idMunicipio) REFERENCES public.Municipio(idMunicipio)
);

CREATE TABLE public.Usuario (
  idUsuario SERIAL PRIMARY KEY,
  nomeCompleto VARCHAR(128) NOT NULL,
  email VARCHAR(128) UNIQUE NOT NULL,
  CPF CHAR(11) UNIQUE NOT NULL,
  telefone CHAR(11) NOT NULL,
  senha VARCHAR(250) NOT NULL,
  idEndereco INT,
  idFuncao INT,
  FOREIGN KEY (idEndereco) REFERENCES public.Endereco(idEndereco),
  FOREIGN KEY (idFuncao) REFERENCES public.Funcao(idFuncao)
);

CREATE TABLE public.Atendimento (
  idAtendimento SERIAL PRIMARY KEY,
  idUsuario INT NOT NULL,
  idTipoAtendimento INT NOT NULL,
  dataChamado DATE NOT NULL DEFAULT CURRENT_DATE,
  idProduto INT,
  descricaoChamado TEXT,
  idSituacao INT NOT NULL,
  justificativa TEXT,
  idAtendente INT,
  dataFinalizado DATE,
  FOREIGN KEY (idUsuario) REFERENCES public.Usuario(idUsuario),
  FOREIGN KEY (idTipoAtendimento) REFERENCES public.TipoAtendimento(idTipoAtendimento),
  FOREIGN KEY (idProduto) REFERENCES public.Produto(idProduto),
  FOREIGN KEY (idSituacao) REFERENCES public.Situacao(idSituacao),
  FOREIGN KEY (idAtendente) REFERENCES public.Usuario(idUsuario)
);