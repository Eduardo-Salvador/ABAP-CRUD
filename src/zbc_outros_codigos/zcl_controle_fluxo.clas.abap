CLASS zcl_controle_fluxo DEFINITION
  PUBLIC FINAL CREATE PUBLIC .
  PUBLIC SECTION.
    METHODS verificar_idade IMPORTING io_pessoa TYPE REF TO zcl_declaracao_variaveis
    RETURNING VALUE(rv_resultado) TYPE string.

    METHODS alterar_status IMPORTING iv_char TYPE c io_out TYPE REF TO if_oo_adt_classrun_out
    RETURNING VALUE(rv_status) TYPE string.

    METHODS contador IMPORTING iv_int TYPE i io_out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.

CLASS zcl_controle_fluxo IMPLEMENTATION.
    METHOD verificar_idade.
      IF io_pessoa->get_inteiro( ) < 0.
        rv_resultado = 'Idade inválida'.
      ELSEIF io_pessoa->get_inteiro( ) >= 18.
        rv_resultado = 'Maior de idade'.
      ELSE.
        rv_resultado = 'Menor de idade'.
      ENDIF.
    ENDMETHOD.

    METHOD alterar_status.
     CASE iv_char.
      WHEN 'A'. rv_status = 'Ativo'.
      WHEN 'I'. rv_status = 'Inativo'.
      WHEN 'F'. rv_status = 'Ferias'.
      WHEN OTHERS.
        io_out->write( 'Status incorreto' ).
     ENDCASE.
    ENDMETHOD.

    METHOD contador.
        DO iv_int TIMES.
            io_out->write( sy-index ).
        ENDDO.
    ENDMETHOD.
ENDCLASS.
