CLASS zcl_declaracao_variaveis DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS constructor
      IMPORTING iv_inteiro TYPE i
                iv_decimal TYPE decfloat16
                iv_texto   TYPE string
                iv_ativo   TYPE abap_bool.

    METHODS get_inteiro    RETURNING VALUE(rv_inteiro) TYPE i.
    METHODS get_decimal    RETURNING VALUE(rv_decimal) TYPE decfloat16.
    METHODS get_texto      RETURNING VALUE(rv_texto)   TYPE string.
    METHODS get_ativo      RETURNING VALUE(rv_ativo)   TYPE abap_bool.
    METHODS get_pi         RETURNING VALUE(rv_pi)      TYPE decfloat16.
    METHODS get_app_nome   RETURNING VALUE(rv_nome)    TYPE string.
    METHODS get_max_idade  RETURNING VALUE(rv_idade)   TYPE i.

    METHODS set_inteiro IMPORTING iv_inteiro TYPE i.
    METHODS set_decimal IMPORTING iv_decimal TYPE decfloat16.
    METHODS set_texto   IMPORTING iv_texto   TYPE string.
    METHODS set_ativo   IMPORTING iv_ativo   TYPE abap_bool.

    METHODS imprimir_variaveis
      IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.

  PRIVATE SECTION.
    CONSTANTS:
      gc_pi        TYPE decfloat16 VALUE '3.14159',
      gc_app_nome  TYPE string     VALUE 'Sistema Bosch',
      gc_max_idade TYPE i          VALUE 120.

    DATA mv_inteiro TYPE i.
    DATA mv_decimal TYPE decfloat16.
    DATA mv_texto   TYPE string.
    DATA mv_ativo   TYPE abap_bool.
    DATA mv_data    TYPE d.

ENDCLASS.

CLASS zcl_declaracao_variaveis IMPLEMENTATION.

  METHOD constructor.
    mv_inteiro = iv_inteiro.
    mv_decimal = iv_decimal.
    mv_texto   = iv_texto.
    mv_ativo   = iv_ativo.
    mv_data    = sy-datum.
  ENDMETHOD.

  METHOD get_inteiro.   rv_inteiro = mv_inteiro. ENDMETHOD.
  METHOD get_decimal.   rv_decimal = mv_decimal. ENDMETHOD.
  METHOD get_texto.     rv_texto   = mv_texto.   ENDMETHOD.
  METHOD get_ativo.     rv_ativo   = mv_ativo.   ENDMETHOD.
  METHOD get_pi.        rv_pi      = gc_pi.       ENDMETHOD.
  METHOD get_app_nome.  rv_nome    = gc_app_nome. ENDMETHOD.
  METHOD get_max_idade. rv_idade   = gc_max_idade. ENDMETHOD.

  METHOD set_inteiro. mv_inteiro = iv_inteiro. ENDMETHOD.
  METHOD set_decimal. mv_decimal = iv_decimal. ENDMETHOD.
  METHOD set_texto.   mv_texto   = iv_texto.   ENDMETHOD.
  METHOD set_ativo.   mv_ativo   = iv_ativo.   ENDMETHOD.

  METHOD imprimir_variaveis.
    io_out->write( mv_inteiro ).
    io_out->write( mv_decimal ).
    io_out->write( mv_texto ).
    io_out->write( mv_data ).
    io_out->write( mv_ativo ).
    io_out->write( gc_pi ).
    io_out->write( gc_app_nome ).
    io_out->write( gc_max_idade ).
  ENDMETHOD.

ENDCLASS.
