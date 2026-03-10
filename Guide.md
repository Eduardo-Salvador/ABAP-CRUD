<div align="center">

# ABAP Language Guide / Guia da Linguagem ABAP

Complete syntax reference for ABAP Cloud development.

Referência completa de sintaxe para desenvolvimento em ABAP Cloud.

---

# Quick Navigation

### [What is ABAP](#what-is-abap--o-que-é-abap)
### [Environment](#environment--ambiente)
### [Variables and Types](#variables-and-types--variáveis-e-tipos)
### [Constants](#constants--constantes)
### [Operators](#operators--operadores)
### [Naming Conventions](#naming-conventions--convenções-de-nomenclatura)
### [Custom Types](#custom-types--tipos-customizados)
### [Classes and Objects](#classes-and-objects--classes-e-objetos)
### [Inheritance](#inheritance--herança)
### [Interfaces](#interfaces--interfaces)
### [Control Flow](#control-flow--estruturas-de-controle)
### [Loops](#loops--estruturas-de-repetição)
### [Internal Tables](#internal-tables--tabelas-internas)
### [Database](#database--banco-de-dados)
### [CRUD](#crud-complete)
### [System Variables](#system-variables--variáveis-de-sistema)
### [Development Flow](#development-flow--fluxo-de-desenvolvimento)

---

</div>

## What is ABAP / O que é ABAP

<div align="center">

![USA](https://img.shields.io/badge/🇺🇸-English-blue)

</div>

**ABAP** (Advanced Business Application Programming) is SAP's proprietary programming language. It runs on the SAP Application Server and is used to customize SAP ERP modules like FI (Finance), MM (Materials), SD (Sales) and HR.

**ABAP Cloud** is the modern, restricted version running on SAP BTP. It enforces clean architecture rules and blocks legacy syntax.

**Z objects:** Any custom development must start with `Z` (or `Y`) — mandatory SAP namespace rule to prevent overwriting standard objects.

**Transport cycle:** `DEV` → `QAS` → `PRD` — similar to Git: feature → staging → main.

<div align="center">

![Brazil](https://img.shields.io/badge/🇧🇷-Português-green)

</div>

**ABAP** (Advanced Business Application Programming) é a linguagem de programação proprietária da SAP. Roda no servidor de aplicações SAP e é usada para customizar módulos como FI (Finanças), MM (Materiais), SD (Vendas) e HR (RH).

**ABAP Cloud** é a versão moderna e restrita rodando no SAP BTP. Impõe regras de arquitetura limpa e bloqueia sintaxe legada.

**Objetos Z:** Todo desenvolvimento customizado deve começar com `Z` (ou `Y`) — regra obrigatória de namespace SAP.

**Ciclo de transporte:** `DEV` → `QAS` → `PRD` — similar ao Git: feature → staging → main.

---

## Environment / Ambiente

1. Create account at [account.hanatrial.ondemand.com](https://account.hanatrial.ondemand.com)
2. BTP Cockpit → **Boosters** → **"Prepare an Account for ABAP Trial"**
3. Download **Service Key** (JSON)
4. Install **Eclipse** + **ADT** plugin (`https://tools.hana.ondemand.com/latest`)
5. `File → New → ABAP Cloud Project` → Service Key → login
6. Install **abapGit** (`https://eclipse.abapgit.org/updatesite/`)

```
Write → Ctrl+S (save) → Ctrl+F3 (activate) → F9 (run)
```

> In ABAP, saving and activating are separate steps. Code only runs after activation. / No ABAP, salvar e ativar são etapas separadas. O código só executa após a ativação.

---

## Variables and Types / Variáveis e Tipos

```abap
" Declaration / Declaração
DATA lv_nome    TYPE string.
DATA lv_idade   TYPE i.
DATA lv_decimal TYPE decfloat16.
DATA lv_data    TYPE d.
DATA lv_hora    TYPE t.
DATA lv_ativo   TYPE abap_bool.
DATA lv_char    TYPE c LENGTH 10.

" Assignment / Atribuição
lv_nome    = 'Eduardo'.
lv_idade   = 22.
lv_decimal = '3.14'.
lv_data    = sy-datum.   " today / hoje
lv_hora    = sy-uzeit.   " now / agora
lv_ativo   = abap_true.  " abap_true / abap_false
```

| Type / Tipo | Java equivalent | Description / Descrição |
|---|---|---|
| `i` | `int` | Integer / Inteiro |
| `decfloat16` | `BigDecimal` | Decimal (ABAP Cloud) |
| `f` | `double` | Float / Ponto flutuante |
| `string` | `String` | Dynamic text / Texto dinâmico |
| `c LENGTH n` | `char[]` | Fixed text / Texto fixo |
| `n LENGTH n` | — | Numeric text / Texto numérico |
| `d` | `LocalDate` | Date YYYYMMDD / Data AAAAMMDD |
| `t` | `LocalTime` | Time HHMMSS / Hora HHMMSS |
| `abap_bool` | `boolean` | `abap_true` / `abap_false` |

---

## Constants / Constantes

```abap
" Public constant / Constante pública
CONSTANTS gc_pi       TYPE decfloat16 VALUE '3.14159'.
CONSTANTS gc_app_name TYPE string     VALUE 'My App'.
CONSTANTS gc_max      TYPE i          VALUE 100.

" Accessing from outside / Acessando de fora
zcl_minha_classe=>gc_pi.

" Private constant (inside PRIVATE SECTION) / Constante privada
" Access only via getter method / Acesso apenas via método getter
```

> `gc_` prefix = global constant. Public constants are accessed with `=>`, private ones require a getter. / Prefixo `gc_` = constante global. Constantes públicas são acessadas com `=>`, privadas requerem getter.

---

## Operators / Operadores

```abap
" Comparison / Comparação (= is both assign and compare / = serve para atribuir e comparar)
IF lv_a = lv_b.    " equal / igual
IF lv_a <> lv_b.   " not equal / diferente
IF lv_a > lv_b.    " greater / maior
IF lv_a < lv_b.    " less / menor
IF lv_a >= lv_b.   " greater or equal / maior ou igual
IF lv_a <= lv_b.   " less or equal / menor ou igual

" Logical / Lógicos
IF lv_a = 1 AND lv_b = 2.
IF lv_a = 1 OR lv_b = 2.
IF NOT lv_ativo = abap_true.

" String concatenation / Concatenação de string
DATA(lv_resultado) = lv_nome && ' - ' && lv_cargo.

" Arithmetic / Aritméticos
lv_total = lv_a + lv_b.
lv_total = lv_a - lv_b.
lv_total = lv_a * lv_b.
lv_total = lv_a / lv_b.
lv_total = lv_a MOD lv_b.  " modulo / módulo
```

---

## Naming Conventions / Convenções de Nomenclatura

| Prefix / Prefixo | Meaning / Significado | Example / Exemplo |
|---|---|---|
| `lv_` | local variable | `lv_nome` |
| `mv_` | member variable (class attribute) | `mv_nome` |
| `iv_` | importing variable (input parameter) | `iv_nome` |
| `rv_` | returning value | `rv_resultado` |
| `ev_` | exporting variable | `ev_resultado` |
| `io_` | importing object | `io_out` |
| `lo_` | local object | `lo_cliente` |
| `mo_` | member object (class attribute) | `mo_conexao` |
| `lt_` | local table (internal table) | `lt_clientes` |
| `ls_` | local structure (single row) | `ls_cliente` |
| `gc_` | global constant | `gc_pi` |
| `ty_` | custom type | `ty_cliente` |
| `ZCL_` | custom class | `ZCL_CLIENTES_DAO` |
| `ZIF_` | custom interface | `ZIF_OPERACOES` |

---

## Custom Types / Tipos Customizados

```abap
" Simple type alias / Alias de tipo simples
TYPES ty_nome TYPE string.

" Structure (like a struct or simple class) / Estrutura (como struct ou classe simples)
TYPES: BEGIN OF ty_cliente,
         id    TYPE i,
         nome  TYPE string,
         email TYPE string,
       END OF ty_cliente.

" Table type / Tipo tabela
TYPES ty_clientes TYPE TABLE OF ty_cliente.

" Using / Usando
DATA ls_cliente  TYPE ty_cliente.
DATA lt_clientes TYPE ty_clientes.

ls_cliente-id    = 1.
ls_cliente-nome  = 'Eduardo'.
ls_cliente-email = 'edu@email.com'.
```

---

## Classes and Objects / Classes e Objetos

```abap
CLASS zcl_pessoa DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS constructor
      IMPORTING iv_nome  TYPE string
                iv_idade TYPE i.
    METHODS get_nome    RETURNING VALUE(rv_nome)  TYPE string.
    METHODS get_idade   RETURNING VALUE(rv_idade) TYPE i.
    METHODS set_nome    IMPORTING iv_nome  TYPE string.
    METHODS set_idade   IMPORTING iv_idade TYPE i.
    METHODS apresentar
      IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.

  PRIVATE SECTION.
    DATA mv_nome  TYPE string.
    DATA mv_idade TYPE i.
ENDCLASS.

CLASS zcl_pessoa IMPLEMENTATION.
  METHOD constructor.
    mv_nome  = iv_nome.
    mv_idade = iv_idade.
  ENDMETHOD.
  METHOD get_nome.   rv_nome  = mv_nome.  ENDMETHOD.
  METHOD get_idade.  rv_idade = mv_idade. ENDMETHOD.
  METHOD set_nome.   mv_nome  = iv_nome.  ENDMETHOD.
  METHOD set_idade.  mv_idade = iv_idade. ENDMETHOD.
  METHOD apresentar.
    io_out->write( mv_nome && ' - ' && mv_idade ).
  ENDMETHOD.
ENDCLASS.

" Instantiating / Instanciando
DATA(lo_pessoa) = NEW zcl_pessoa( iv_nome = 'Eduardo' iv_idade = 22 ).
out->write( lo_pessoa->get_nome( ) ).
lo_pessoa->set_nome( 'Eduardo Salvador' ).
lo_pessoa->apresentar( io_out = out ).
```

> `DEFINITION` = contract / contrato — declares what exists. `IMPLEMENTATION` = logic / lógica — defines how it works.

---

## Inheritance / Herança

```abap
" Base class / Classe base
CLASS zcl_animal DEFINITION PUBLIC CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_nome TYPE string.
    METHODS get_nome    RETURNING VALUE(rv_nome) TYPE string.
    METHODS emitir_som  " to be overridden / para ser sobrescrito
      IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
    DATA mv_nome TYPE string.
ENDCLASS.

CLASS zcl_animal IMPLEMENTATION.
  METHOD constructor. mv_nome = iv_nome. ENDMETHOD.
  METHOD get_nome.    rv_nome = mv_nome. ENDMETHOD.
  METHOD emitir_som.
    io_out->write( mv_nome && ' faz um som.' ).
  ENDMETHOD.
ENDCLASS.

" Subclass / Subclasse — note: INHERITING FROM, not FINAL
CLASS zcl_cachorro DEFINITION PUBLIC
  INHERITING FROM zcl_animal
  CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS emitir_som REDEFINITION.  " override / sobrescrever
ENDCLASS.

CLASS zcl_cachorro IMPLEMENTATION.
  METHOD emitir_som.
    io_out->write( mv_nome && ' late: Au au!' ).
  ENDMETHOD.
ENDCLASS.

" Using / Usando
DATA(lo_cachorro) = NEW zcl_cachorro( iv_nome = 'Rex' ).
lo_cachorro->emitir_som( io_out = out ).  " Rex late: Au au!
```

> `FINAL` prevents inheritance. Remove it to allow subclassing. / `FINAL` impede herança. Remova para permitir subclasses.
> `PROTECTED SECTION` = accessible by subclasses. / `PROTECTED SECTION` = acessível por subclasses.

---

## Interfaces / Interfaces

```abap
" Define interface / Definir interface
INTERFACE zif_operacoes.
  METHODS calcular
    IMPORTING iv_a          TYPE i
              iv_b          TYPE i
    RETURNING VALUE(rv_res) TYPE i.
ENDINTERFACE.

" Implement interface / Implementar interface
CLASS zcl_soma DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_operacoes.
ENDCLASS.

CLASS zcl_soma IMPLEMENTATION.
  METHOD zif_operacoes~calcular.  " note the ~ to reference interface method
    rv_res = iv_a + iv_b.
  ENDMETHOD.
ENDCLASS.

" Using / Usando
DATA(lo_soma) = NEW zcl_soma( ).
DATA(lv_resultado) = lo_soma->zif_operacoes~calcular( iv_a = 5 iv_b = 3 ).
out->write( lv_resultado ).  " 8
```

---

## Control Flow / Estruturas de Controle

```abap
" IF / ELSEIF / ELSE
IF lv_idade >= 18.
  rv_resultado = 'Maior de idade'.
ELSEIF lv_idade < 0.
  rv_resultado = 'Idade inválida'.
ELSE.
  rv_resultado = 'Menor de idade'.
ENDIF.

" CASE / WHEN
CASE lv_status.
  WHEN 'A'. rv_texto = 'Ativo'.
  WHEN 'I'. rv_texto = 'Inativo'.
  WHEN 'F'. rv_texto = 'Férias'.
  WHEN OTHERS. rv_texto = 'Desconhecido'.
ENDCASE.
```

---

## Loops / Estruturas de Repetição

```abap
" DO TIMES — fixed iterations / iterações fixas (like for / como for)
DO 10 TIMES.
  out->write( sy-index ).  " 1 to 10
ENDDO.

" DO without limit — needs EXIT / sem limite — precisa de EXIT
DO.
  IF lv_contador >= 10.
    EXIT.  " like break / como break
  ENDIF.
  lv_contador = lv_contador + 1.
ENDDO.

" WHILE — condition loop / loop com condição (like while / como while)
WHILE lv_contador < 10.
  lv_contador = lv_contador + 1.
ENDWHILE.

" LOOP AT — iterate internal table / iterar tabela interna (like for-each / como for-each)
LOOP AT lt_clientes INTO ls_cliente.
  out->write( ls_cliente-nome ).
ENDLOOP.

" LOOP AT with condition / com condição
LOOP AT lt_clientes INTO ls_cliente WHERE idade >= 18.
  out->write( ls_cliente-nome ).
ENDLOOP.

" EXIT — break out of loop / sair do loop (like break)
LOOP AT lt_clientes INTO ls_cliente.
  IF ls_cliente-nome = 'Eduardo'.
    EXIT.
  ENDIF.
ENDLOOP.

" CONTINUE — skip to next iteration / pular para próxima iteração (like continue)
LOOP AT lt_clientes INTO ls_cliente.
  IF ls_cliente-ativo = abap_false.
    CONTINUE.
  ENDIF.
  out->write( ls_cliente-nome ).
ENDLOOP.
```

| ABAP | Java equivalent |
|---|---|
| `DO n TIMES` | `for(int i = 0; i < n; i++)` |
| `WHILE condition` | `while(condition)` |
| `LOOP AT lt INTO ls` | `for(T item : list)` |
| `EXIT` | `break` |
| `CONTINUE` | `continue` |
| `sy-index` | loop counter `i` |
| `sy-tabix` | current table index in LOOP AT |

---

## Internal Tables / Tabelas Internas

```abap
" Declare / Declarar
TYPES: BEGIN OF ty_funcionario,
         nome  TYPE string,
         idade TYPE i,
         cargo TYPE string,
       END OF ty_funcionario.
TYPES ty_funcionarios TYPE TABLE OF ty_funcionario.

DATA lt_funcionarios TYPE ty_funcionarios.
DATA ls_funcionario  TYPE ty_funcionario.

" Add row / Adicionar linha
ls_funcionario-nome  = 'Eduardo'.
ls_funcionario-idade = 22.
ls_funcionario-cargo = 'Dev ABAP'.
APPEND ls_funcionario TO lt_funcionarios.

" Iterate / Iterar
LOOP AT lt_funcionarios INTO ls_funcionario.
  out->write( ls_funcionario-nome && ' - ' && ls_funcionario-cargo ).
ENDLOOP.

" Search / Buscar
READ TABLE lt_funcionarios INTO ls_funcionario WITH KEY nome = 'Eduardo'.
IF sy-subrc = 0.
  out->write( 'Encontrado: ' && ls_funcionario-cargo ).
ENDIF.

" Modify row / Modificar linha
READ TABLE lt_funcionarios INTO ls_funcionario WITH KEY nome = 'Eduardo'.
IF sy-subrc = 0.
  ls_funcionario-cargo = 'Arquiteto SAP'.
  MODIFY lt_funcionarios FROM ls_funcionario INDEX sy-tabix.
ENDIF.

" Delete row / Deletar linha
DELETE lt_funcionarios WHERE nome = 'Eduardo'.

" Delete inside loop / Deletar dentro do loop
LOOP AT lt_funcionarios INTO ls_funcionario.
  IF ls_funcionario-idade < 18.
    DELETE lt_funcionarios INDEX sy-tabix.
  ENDIF.
ENDLOOP.

" Sort / Ordenar
SORT lt_funcionarios BY nome ASCENDING.
SORT lt_funcionarios BY idade DESCENDING.

" Count rows / Contar linhas
out->write( lines( lt_funcionarios ) ).

" Clear table / Limpar tabela
CLEAR lt_funcionarios.
```

---

## Database / Banco de Dados

```abap
" Multiple rows / Múltiplas linhas
SELECT *
  FROM zclientes1
  INTO TABLE @lt_clientes
  UP TO 100 ROWS.

" Specific fields / Campos específicos
SELECT id nome
  FROM zclientes1
  INTO TABLE @lt_clientes
  WHERE idade >= 18
  ORDER BY nome ASCENDING
  UP TO 50 ROWS.

" Single row / Uma linha
SELECT SINGLE *
  FROM zclientes1
  WHERE id = @iv_id
  INTO @ls_cliente.

" Always check / Sempre verificar
IF sy-subrc = 0.
  " found / encontrou
ELSE.
  " not found / não encontrou
ENDIF.
```

> `@` before variables is **mandatory** in ABAP Cloud. `UP TO n ROWS` = `LIMIT n` in SQL. / `@` antes das variáveis é **obrigatório** no ABAP Cloud. `UP TO n ROWS` = `LIMIT n` no SQL.

---

## CRUD Complete

```abap
" INSERT
ls_cliente-id    = '00000001'.
ls_cliente-nome  = 'Eduardo'.
ls_cliente-email = 'edu@email.com'.
INSERT zclientes1 FROM @ls_cliente.
IF sy-subrc = 0. COMMIT WORK. ENDIF.

" READ ALL / LER TODOS
SELECT * FROM zclientes1 INTO TABLE @lt_clientes.
LOOP AT lt_clientes INTO DATA(ls_c).
  out->write( ls_c-id && ' - ' && ls_c-nome && ' - ' && ls_c-email ).
ENDLOOP.

" UPDATE — always SELECT SINGLE first / sempre SELECT SINGLE antes
SELECT SINGLE * FROM zclientes1 WHERE id = @iv_id INTO @ls_cliente.
IF sy-subrc = 0.
  ls_cliente-nome  = iv_novo_nome.
  ls_cliente-email = iv_novo_email.
  UPDATE zclientes1 FROM @ls_cliente.
  IF sy-subrc = 0. COMMIT WORK. ENDIF.
ENDIF.

" DELETE
DELETE FROM zclientes1 WHERE id = @iv_id.
IF sy-subrc = 0. COMMIT WORK. ENDIF.
```

> `COMMIT WORK` persists the transaction. Without it, changes are rolled back. / `COMMIT WORK` persiste a transação. Sem ele, as alterações são revertidas.

---

## System Variables / Variáveis de Sistema

| Variable / Variável | Meaning / Significado |
|---|---|
| `sy-subrc` | Last operation result. 0 = success / Resultado da última operação. 0 = sucesso |
| `sy-datum` | Today's date / Data de hoje |
| `sy-uzeit` | Current time / Hora atual |
| `sy-index` | Counter in DO loop / Contador no loop DO |
| `sy-tabix` | Current row index in LOOP AT / Índice da linha atual no LOOP AT |
| `sy-uname` | Current user / Usuário atual |
| `sy-langu` | System language / Idioma do sistema |

---

## Development Flow / Fluxo de Desenvolvimento

```
Write → Ctrl+S (save/salvar) → Ctrl+F3 (activate/ativar) → F9 (run/executar)
```

| Action / Ação | Shortcut |
|---|---|
| Save / Salvar | `Ctrl+S` |
| Activate / Ativar | `Ctrl+F3` |
| Run / Executar | `F9` |
| Clear console / Limpar console | Right-click console → Clear |
| Open ABAP perspective | `Window → Perspective → ABAP` |
