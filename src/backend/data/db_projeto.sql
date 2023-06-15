BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "favorito" (
	"data"	TEXT NOT NULL,
	"id_usuario"	INTEGER NOT NULL,
	"id_tabela"	INTEGER NOT NULL,
	PRIMARY KEY("id_usuario","id_tabela","data"),
	FOREIGN KEY("id_usuario") REFERENCES "usuario"("id_usuario"),
	FOREIGN KEY("id_tabela") REFERENCES "tabela"("id")
);
CREATE TABLE IF NOT EXISTS "solicitacoes" (
	"id_solicitacao"	INTEGER NOT NULL,
	"id_usuario"	NUMERIC NOT NULL,
	"data"	DATETIME NOT NULL,
	"sql_code"	INTEGER NOT NULL,
	PRIMARY KEY("id_solicitacao" AUTOINCREMENT),
	FOREIGN KEY("id_usuario") REFERENCES "usuario"("id_usuario")
);
CREATE TABLE IF NOT EXISTS "usuario" (
	"id_usuario"	INTEGER NOT NULL UNIQUE,
	"nome"	TEXT NOT NULL,
	PRIMARY KEY("id_usuario" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "campo" (
	"id_tabela"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	"descricao"	TEXT NOT NULL,
	"tipo"	TEXT NOT NULL,
	PRIMARY KEY("id_tabela"),
	FOREIGN KEY("id_tabela") REFERENCES "tabela"("id")
);
CREATE TABLE IF NOT EXISTS "feedback" (
	"id_tabela"	INTEGER NOT NULL,
	"avaliacao"	TEXT,
	"comentario"	TEXT,
	PRIMARY KEY("id_tabela")
);
CREATE TABLE IF NOT EXISTS "tabela" (
	"id"	INTEGER NOT NULL,
	"id_bd"	TEXT NOT NULL,
	"nome"	TEXT NOT NULL,
	"categoria"	TEXT NOT NULL,
	"descricao"	TEXT NOT NULL,
	"criticidade"	boolean NOT NULL,
	"dado_sensivel"	boolean NOT NULL,
	"verificacao_governanca"	boolean NOT NULL,
	"defasagem"	TEXT NOT NULL,
	"database"	TEXT NOT NULL,
	"caminho"	TEXT NOT NULL,
	"script_alimentacao"	TEXT NOT NULL,
	"eng_ingestao"	TEXT NOT NULL,
	"owner"	TEXT NOT NULL,
	"steward"	TEXT NOT NULL,
	"ajuste_nomenclatura"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "variaveis" (
	"id_variaveis"	INTEGER,
	"categoria"	TEXT,
	"nome_tabela"	TEXT,
	"nome_campo"	TEXT,
	"tipo_campo"	TEXT,
	"tipo_pessoa"	TEXT,
	"descricao_campo"	TEXT,
	"PK"	TEXT,
	"null"	INTEGER,
	"UNQ"	INTEGER,
	"volatil"	INTEGER,
	"LGPD"	INTEGER
);
COMMIT;
