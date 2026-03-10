<div align="center">

[![Generic badge](https://img.shields.io/badge/STATUS-IN_PROGRESS-<COLOR>.svg)](https://shields.io/) [![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://github.com/Eduardo-Salvador)

---

# SAP ABAP CRUD Repository

A practical and progressive study of SAP ABAP development on SAP BTP Trial using Eclipse ADT.

Um estudo prático e progressivo de desenvolvimento SAP ABAP no SAP BTP Trial usando Eclipse ADT.

---


## Technologies

#### Main
![SAP](https://img.shields.io/badge/SAP-0FAAFF?style=for-the-badge&logo=sap&logoColor=white)

#### Environment
![Eclipse](https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=eclipse&logoColor=white)

---

## Overview / Resumo

![USA](https://img.shields.io/badge/🇺🇸-English-blue)

This project covers the fundamentals of ABAP language with focus on:

**Object-Oriented Programming in ABAP  
Variables, Types and Constants  
Control Flow (IF, CASE, Loops)  
Internal Tables (APPEND, LOOP AT, READ TABLE)  
Custom Database Table Creation (DDIC)  
Full CRUD Operations on SAP Database  
Version Control with abapGit**

All topics are organized into modular classes, each covering a specific concept.

> For the complete syntax reference and language guide, see [GUIDE.md](./GUIDE.md)

</div>

<div align="center">

**The primary goal is to document a structured and progressive ABAP learning journey.**

---

![Brazil](https://img.shields.io/badge/🇧🇷-Português-green)

O projeto cobre os fundamentos da linguagem ABAP com foco em:

**Programação Orientada a Objetos em ABAP  
Variáveis, Tipos e Constantes  
Estruturas de Controle (IF, CASE, Loops)  
Tabelas Internas (APPEND, LOOP AT, READ TABLE)  
Criação de Tabela Customizada no Banco (DDIC)  
Operações CRUD completas no banco SAP  
Versionamento com abapGit**

Os tópicos estão organizados em classes modulares, cada uma cobrindo um conceito específico.

> Para a referência completa de sintaxe e guia da linguagem, veja [GUIDE.md](./GUIDE.md)

</div>

<div align="center">

---

## Getting Started / Como Rodar

![USA](https://img.shields.io/badge/🇺🇸-English-blue)

</div>

1. Clone the repository
2. Open Eclipse with ADT installed and connected to SAP BTP Trial
3. In abapGit: link this repository to your package
4. Activate all objects with `Ctrl+F3`
5. Open `ZCL_CRUD_MAIN` and run with `F9`

<div align="center">

![Brazil](https://img.shields.io/badge/🇧🇷-Português-green)

</div>

1. Clone o repositório
2. Abra o Eclipse com ADT instalado e conectado ao SAP BTP Trial
3. No abapGit: vincule este repositório ao seu pacote
4. Ative todos os objetos com `Ctrl+F3`
5. Abra `ZCL_CRUD_MAIN` e execute com `F9`

<div align="center">
  
> For environment setup, see [GUIDE.md](./GUIDE.md#environment--ambiente)
> 
---

## Important Notes / Observações Importantes

![USA](https://img.shields.io/badge/🇺🇸-English-blue)

</div>

- This project uses **ABAP Cloud** (SAP BTP Trial), which has syntax differences from classic ABAP (ERP/S4HANA).
- Classic commands like `WRITE` are not available, `out->write()` is used instead.
- Some standard SAP tables (e.g. `SCARR`) are blocked in ABAP Cloud.
- The `@` prefix before variables in SELECT statements is mandatory in ABAP Cloud.
- Object names follow the `Z` prefix convention — mandatory for all custom development in SAP.
- The deviation from classic ABAP syntax does not reflect lack of knowledge, but rather the constraints and best practices of ABAP Cloud.

<div align="center">

![Brazil](https://img.shields.io/badge/🇧🇷-Português-green)

</div>

- Este projeto usa **ABAP Cloud** (SAP BTP Trial), que tem diferenças de sintaxe em relação ao ABAP clássico (ERP/S4HANA).
- Comandos clássicos como `WRITE` não estão disponíveis, usa-se `out->write()`.
- Algumas tabelas padrão SAP (ex: `SCARR`) são bloqueadas no ABAP Cloud.
- O prefixo `@` antes de variáveis em SELECT é obrigatório no ABAP Cloud.
- Nomes de objetos seguem a convenção do prefixo `Z` — obrigatório para todo desenvolvimento customizado no SAP.
- O desvio da sintaxe clássica não reflete falta de conhecimento, mas sim as restrições e boas práticas do ABAP Cloud.

---

## Project Structure / Estrutura do Projeto

```
ABAP-CRUD/
  src/
    ZCL_DECLARACAO_VARIAVEIS   → Variables, types, constants, getters and setters
    ZCL_CONTROLE_FLUXO         → IF, CASE, DO loops
    ZCL_INTERNAL_TABLE         → Internal tables, APPEND, LOOP AT
    ZCL_CLIENTES_DAO           → Full CRUD on SAP database (DAO pattern)
    ZCLIENTES1                 → Custom database table (id, nome, email)
    ZMAINBOSCH                 → Main execution class
```

---

## Achieved Goals / Objetivos Alcançados

- ABAP OOP fundamentals: classes, constructor, getters and setters / Fundamentos de OOP em ABAP: classes, construtor, getters e setters
- Control flow: IF, CASE, DO loops / Estruturas de controle: IF, CASE, loops DO
- Internal tables: APPEND, LOOP AT, READ TABLE / Tabelas internas: APPEND, LOOP AT, READ TABLE
- Custom database table ZCLIENTES1 via DDIC / Tabela customizada ZCLIENTES1 via DDIC
- Full CRUD operations with sy-subrc validation / CRUD completo com validação via sy-subrc

---
