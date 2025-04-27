-- Criação das tabelas para o e-commerce da Vinheria Agnello (SQL Server)

-- Tabela de Usuários
CREATE TABLE USUARIO (
    usuario_id INT PRIMARY KEY IDENTITY(1,1),
    nome NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    senha NVARCHAR(255) NOT NULL,
    telefone NVARCHAR(20),
    data_nascimento DATE NOT NULL,  -- Importante para verificação de idade
    data_cadastro DATETIME DEFAULT GETDATE(),
    ativo BIT DEFAULT 1,
    tipo_usuario NVARCHAR(20) DEFAULT 'cliente' CHECK (tipo_usuario IN ('cliente', 'admin'))
);

-- Tabela de Endereços
CREATE TABLE ENDERECO (
    endereco_id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT NOT NULL,
    cep NVARCHAR(10) NOT NULL,
    logradouro NVARCHAR(150) NOT NULL,
    numero NVARCHAR(10) NOT NULL,
    complemento NVARCHAR(100),
    bairro NVARCHAR(100) NOT NULL,
    cidade NVARCHAR(100) NOT NULL,
    estado NVARCHAR(50) NOT NULL,
    pais NVARCHAR(50) DEFAULT 'Brasil',
    endereco_principal BIT DEFAULT 0,
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id)
);

-- Tabela de Categorias de Vinhos
CREATE TABLE CATEGORIA (
    categoria_id INT PRIMARY KEY IDENTITY(1,1),
    nome NVARCHAR(50) NOT NULL UNIQUE,
    descricao NVARCHAR(MAX),
    ativo BIT DEFAULT 1
);

-- Tabela de Regiões Vinícolas
CREATE TABLE REGIAO (
    regiao_id INT PRIMARY KEY IDENTITY(1,1),
    nome NVARCHAR(100) NOT NULL,
    pais NVARCHAR(100) NOT NULL,
    descricao NVARCHAR(MAX),
    ativo BIT DEFAULT 1
);

-- Tabela de Produtos (Vinhos)
CREATE TABLE PRODUTO (
    produto_id INT PRIMARY KEY IDENTITY(1,1),
    categoria_id INT NOT NULL,
    regiao_id INT NOT NULL,
    nome NVARCHAR(150) NOT NULL,
    descricao NVARCHAR(MAX),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    imagem_url NVARCHAR(255),
    ativo BIT DEFAULT 1,
    data_cadastro DATETIME DEFAULT GETDATE(),
    codigo_sku NVARCHAR(50) UNIQUE,
    teor_alcoolico DECIMAL(4,2),
    ano_safra INT,
    volume_ml INT,
    FOREIGN KEY (categoria_id) REFERENCES CATEGORIA(categoria_id),
    FOREIGN KEY (regiao_id) REFERENCES REGIAO(regiao_id)
);

-- Tabela de Tipos de Uva
CREATE TABLE UVA (
    uva_id INT PRIMARY KEY IDENTITY(1,1),
    nome NVARCHAR(100) NOT NULL UNIQUE,
    descricao NVARCHAR(MAX),
    ativo BIT DEFAULT 1
);

-- Tabela de relacionamento Produto-Uva (muitos para muitos)
CREATE TABLE PRODUTO_UVA (
    produto_uva_id INT PRIMARY KEY IDENTITY(1,1),
    produto_id INT NOT NULL,
    uva_id INT NOT NULL,
    percentual DECIMAL(5,2),  -- Percentual da uva na composição do vinho
    FOREIGN KEY (produto_id) REFERENCES PRODUTO(produto_id),
    FOREIGN KEY (uva_id) REFERENCES UVA(uva_id),
    CONSTRAINT unique_produto_uva UNIQUE (produto_id, uva_id)
);

-- Tabela de Harmonizações (Pratos, alimentos)
CREATE TABLE HARMONIZACAO (
    harmonizacao_id INT PRIMARY KEY IDENTITY(1,1),
    nome NVARCHAR(100) NOT NULL,
    descricao NVARCHAR(MAX),
    tipo NVARCHAR(20) NOT NULL CHECK (tipo IN ('prato', 'ingrediente', 'ocasiao')),
    ativo BIT DEFAULT 1
);

-- Tabela de relacionamento Produto-Harmonização (muitos para muitos)
CREATE TABLE PRODUTO_HARMONIZACAO (
    produto_harmonizacao_id INT PRIMARY KEY IDENTITY(1,1),
    produto_id INT NOT NULL,
    harmonizacao_id INT NOT NULL,
    nivel_compatibilidade INT CHECK (nivel_compatibilidade BETWEEN 1 AND 5),
    FOREIGN KEY (produto_id) REFERENCES PRODUTO(produto_id),
    FOREIGN KEY (harmonizacao_id) REFERENCES HARMONIZACAO(harmonizacao_id),
    CONSTRAINT unique_produto_harmonizacao UNIQUE (produto_id, harmonizacao_id)
);

-- Tabela de Pedidos
CREATE TABLE PEDIDO (
    pedido_id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT NOT NULL,
    endereco_entrega_id INT NOT NULL,
    data_pedido DATETIME DEFAULT GETDATE(),
    data_atualizacao DATETIME DEFAULT GETDATE(),
    status NVARCHAR(30) DEFAULT 'aguardando_pagamento' 
        CHECK (status IN ('aguardando_pagamento', 'pago', 'em_preparacao', 'enviado', 'entregue', 'cancelado')),
    valor_produtos DECIMAL(10,2) NOT NULL,
    valor_frete DECIMAL(10,2) NOT NULL,
    valor_desconto DECIMAL(10,2) DEFAULT 0,
    valor_total DECIMAL(10,2) NOT NULL,
    codigo_rastreio NVARCHAR(50),
    forma_pagamento NVARCHAR(50) NOT NULL,
    numero_transacao NVARCHAR(100),
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id),
    FOREIGN KEY (endereco_entrega_id) REFERENCES ENDERECO(endereco_id)
);

-- Trigger para atualizar data_atualizacao do pedido
CREATE TRIGGER trg_pedido_update
ON PEDIDO
AFTER UPDATE
AS
BEGIN
    UPDATE PEDIDO
    SET data_atualizacao = GETDATE()
    FROM PEDIDO p
    INNER JOIN inserted i ON p.pedido_id = i.pedido_id;
END;

-- Tabela de Itens do Pedido
CREATE TABLE ITEM_PEDIDO (
    item_pedido_id INT PRIMARY KEY IDENTITY(1,1),
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES PEDIDO(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES PRODUTO(produto_id)
);

-- Tabela de Carrinho de Compras
CREATE TABLE CARRINHO (
    carrinho_id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT,  -- Pode ser NULL para usuários não logados
    data_criacao DATETIME DEFAULT GETDATE(),
    data_atualizacao DATETIME DEFAULT GETDATE(),
    ativo BIT DEFAULT 1,
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id)
);

-- Trigger para atualizar data_atualizacao do carrinho
CREATE TRIGGER trg_carrinho_update
ON CARRINHO
AFTER UPDATE
AS
BEGIN
    UPDATE CARRINHO
    SET data_atualizacao = GETDATE()
    FROM CARRINHO c
    INNER JOIN inserted i ON c.carrinho_id = i.carrinho_id;
END;

-- Tabela de Itens do Carrinho
CREATE TABLE ITEM_CARRINHO (
    item_carrinho_id INT PRIMARY KEY IDENTITY(1,1),
    carrinho_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    data_adicao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (carrinho_id) REFERENCES CARRINHO(carrinho_id),
    FOREIGN KEY (produto_id) REFERENCES PRODUTO(produto_id),
    CONSTRAINT unique_carrinho_produto UNIQUE (carrinho_id, produto_id)
);

-- Tabela de Avaliações de Produtos
CREATE TABLE AVALIACAO (
    avaliacao_id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT NOT NULL,
    produto_id INT NOT NULL,
    estrelas INT NOT NULL CHECK (estrelas BETWEEN 1 AND 5),
    comentario NVARCHAR(MAX),
    data_avaliacao DATETIME DEFAULT GETDATE(),
    aprovado BIT DEFAULT 0,  -- Moderação de avaliações
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id),
    FOREIGN KEY (produto_id) REFERENCES PRODUTO(produto_id)
);

-- Tabela de Conversas com a IA
CREATE TABLE CONVERSA_IA (
    conversa_id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT,  -- Pode ser NULL para usuários não logados
    data_inicio DATETIME DEFAULT GETDATE(),
    data_fim DATETIME NULL,
    ativa BIT DEFAULT 1,
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id)
);

-- Tabela de Mensagens na Conversa com IA
CREATE TABLE MENSAGEM_IA (
    mensagem_id INT PRIMARY KEY IDENTITY(1,1),
    conversa_id INT NOT NULL,
    conteudo NVARCHAR(MAX) NOT NULL,
    timestamp DATETIME DEFAULT GETDATE(),
    origem NVARCHAR(10) NOT NULL CHECK (origem IN ('usuario', 'ia')),
    contexto NVARCHAR(MAX),  -- Armazena contexto adicional em formato JSON
    FOREIGN KEY (conversa_id) REFERENCES CONVERSA_IA(conversa_id)
);

-- Tabela de Recomendações feitas pela IA
CREATE TABLE RECOMENDACAO_IA (
    recomendacao_id INT PRIMARY KEY IDENTITY(1,1),
    mensagem_id INT NOT NULL,
    produto_id INT NOT NULL,
    motivo_recomendacao NVARCHAR(255),
    relevancia INT CHECK (relevancia BETWEEN 1 AND 10),
    FOREIGN KEY (mensagem_id) REFERENCES MENSAGEM_IA(mensagem_id),
    FOREIGN KEY (produto_id) REFERENCES PRODUTO(produto_id)
);

-- Índices adicionais para otimização
CREATE INDEX idx_produto_categoria ON PRODUTO(categoria_id);
CREATE INDEX idx_produto_regiao ON PRODUTO(regiao_id);
CREATE INDEX idx_pedido_usuario ON PEDIDO(usuario_id);
CREATE INDEX idx_pedido_status ON PEDIDO(status);
CREATE INDEX idx_item_pedido_produto ON ITEM_PEDIDO(produto_id);
CREATE INDEX idx_conversa_usuario ON CONVERSA_IA(usuario_id);