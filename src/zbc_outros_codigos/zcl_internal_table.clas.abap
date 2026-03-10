CLASS zcl_internal_table DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS preencher_tabela.
    METHODS imprimir_tabela IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
  PRIVATE SECTION.
    TYPES: BEGIN OF ty_funcionario,
           nome  TYPE string,
           idade TYPE i,
           cargo TYPE string,
         END OF ty_funcionario.
    TYPES ty_funcionarios TYPE TABLE OF ty_funcionario.
    DATA lt_funcionarios TYPE ty_funcionarios.
ENDCLASS.

CLASS zcl_internal_table IMPLEMENTATION.
    METHOD preencher_tabela.
        DATA ls_func TYPE ty_funcionario.
        ls_func-nome = 'Eduardo'.
        ls_func-idade = 25.
        ls_func-cargo = 'Dev Abap'.
        APPEND ls_func TO lt_funcionarios.
        ls_func-nome = 'Joao'.
        ls_func-idade = 22.
        ls_func-cargo = 'Dev Fiori'.
        APPEND ls_func TO lt_funcionarios.
        ls_func-nome = 'Maria'.
        ls_func-idade = 26.
        ls_func-cargo = 'Dev PHP'.
        APPEND ls_func TO lt_funcionarios.
    ENDMETHOD.

    METHOD imprimir_tabela.
      DATA ls_func TYPE ty_funcionario.
      LOOP AT lt_funcionarios INTO ls_func.
        io_out->write( 'Nome:' && ls_func-nome && ' - Idade:' && ls_func-idade && ' - Cargo:' && ls_func-cargo ).
      ENDLOOP.
    ENDMETHOD.
ENDCLASS.
