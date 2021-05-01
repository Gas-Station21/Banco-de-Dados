/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     01/05/2021 17:47:21                          */
/*==============================================================*/


/*==============================================================*/
/* Table: CADASTRO_EMPRESA                                      */
/*==============================================================*/
create table CADASTRO_EMPRESA
(
   COD_CADASTRO_EMPRESA integer not null,
   COD_ENDERECO         integer not null,
   NOM_EMPRESA          varchar(200),
   NUM_CNPJ             int(14),
   DES_EMAIL            varchar(50),
   NUM_TELEFONE         int(11)
);

alter table CADASTRO_EMPRESA
   add primary key (COD_CADASTRO_EMPRESA);

/*==============================================================*/
/* Table: CADASTRO_PESSOA_FISICA                                */
/*==============================================================*/
create table CADASTRO_PESSOA_FISICA
(
   COD_PESSOA_FISICA    integer not null,
   COD_ENDERECO         integer not null,
   NOM_PESSOA           varchar(200),
   NUM_CPF              int(11),
   DES_EMAIL            varchar(50),
   NUM_TELEFONE         int(11)
);

alter table CADASTRO_PESSOA_FISICA
   add primary key (COD_PESSOA_FISICA, COD_ENDERECO);

/*==============================================================*/
/* Table: CADASTRO_POSTO                                        */
/*==============================================================*/
create table CADASTRO_POSTO
(
   COD_CADASTRO_POSTO   integer not null,
   COD_ENDERECO         integer not null,
   NOM_POSTO            varchar(200),
   DES_EMAIL            varchar(50),
   NUM_TELEFONE         int(11),
   NUM_CNPJ             int(14),
   HOR_FUNCIONAMENTO    time,
   DES_COORDENADA_GEOGRAFICA varchar(50),
   DES_RAZAO_SOCIAL     varchar(200)
);

alter table CADASTRO_POSTO
   add primary key (COD_CADASTRO_POSTO);

/*==============================================================*/
/* Table: ENDERECO                                              */
/*==============================================================*/
create table ENDERECO
(
   COD_ENDERECO         integer not null,
   DES_LOGRADOURO       varchar(200),
   NUM_NUMERO           int,
   NOM_COMPLEMENTO      varchar(100),
   NUM_CEP              int(8),
   NOM_BAIRRO           varchar(50),
   NOM_ESTADO           varchar(50)
);

alter table ENDERECO
   add primary key (COD_ENDERECO);

/*==============================================================*/
/* Table: FILTRAR_POSTO                                         */
/*==============================================================*/
create table FILTRAR_POSTO
(
   COD_FILTRAR_POSTO    smallint not null,
   COD_CADASTRO_POSTO   integer not null,
   NOM_POSTO            varchar(200),
   VAL_PRECO_COMBUSTIVEL float(13,2,
   DES_LOCALIDADE       varchar(100),
   DES_TIPO_COMBUSTIVEL varchar(200)
);

alter table FILTRAR_POSTO
   add primary key (COD_FILTRAR_POSTO, COD_CADASTRO_POSTO);

/*==============================================================*/
/* Table: HISTORICO_PRECOS                                      */
/*==============================================================*/
create table HISTORICO_PRECOS
(
   COD_HISTORICO_PRECOS smallint not null,
   COD_CADASTRO_POSTO   integer not null,
   DES_TABELA_COMBUSTIVEL varchar(1000),
   DES_TIPO_COMBUSTIVEL varchar(200),
   DTA_DATA_PRECO       date,
   HOR_ATUALIZACAO_HORA time,
   VAL_PRECO_COMBUSTIVEL float(13,2)
);

alter table HISTORICO_PRECOS
   add primary key (COD_HISTORICO_PRECOS);

/*==============================================================*/
/* Table: INSERIR_COMENTARIO                                    */
/*==============================================================*/
create table INSERIR_COMENTARIO
(
   COD_COMENTARIO       integer not null,
   COD_PESSOA_FISICA    integer not null,
   COD_ENDERECO         integer not null,
   NOM_NOME_CLIENTE     varchar(100),
   DES_COMENTARIO       varchar(200)
);

alter table INSERIR_COMENTARIO
   add primary key (COD_COMENTARIO);

alter table CADASTRO_EMPRESA add constraint FK_ENDERECO_CADASTRO_EMPRESA foreign key (COD_ENDERECO)
      references ENDERECO (COD_ENDERECO) on delete restrict on update restrict;

alter table CADASTRO_PESSOA_FISICA add constraint FK_ENDERECO_CADASTRO_PESSOA_FISICA foreign key (COD_ENDERECO)
      references ENDERECO (COD_ENDERECO) on delete restrict on update restrict;

alter table CADASTRO_POSTO add constraint FK_ENDERECO_CADASTRO_POSTO foreign key (COD_ENDERECO)
      references ENDERECO (COD_ENDERECO) on delete restrict on update restrict;

alter table FILTRAR_POSTO add constraint FK_CADASTRO_POSTO_FILTRAR_POSTO foreign key (COD_CADASTRO_POSTO)
      references CADASTRO_POSTO (COD_CADASTRO_POSTO) on delete restrict on update restrict;

alter table HISTORICO_PRECOS add constraint FK_CADASTRO_POSTO foreign key (COD_CADASTRO_POSTO)
      references CADASTRO_POSTO (COD_CADASTRO_POSTO) on delete restrict on update restrict;

alter table INSERIR_COMENTARIO add constraint FK_CADASTRO_PESSOA_FISICA_INSERIR_COMENTARIO foreign key (COD_PESSOA_FISICA, COD_ENDERECO)
      references CADASTRO_PESSOA_FISICA (COD_PESSOA_FISICA, COD_ENDERECO) on delete restrict on update restrict;

