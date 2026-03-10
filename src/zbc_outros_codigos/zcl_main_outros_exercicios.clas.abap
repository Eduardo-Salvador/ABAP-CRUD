CLASS zcl_main_outros_exercicios DEFINITION
  PUBLIC FINAL CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_main_outros_exercicios IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
      DATA lo_vars TYPE REF TO zcl_declaracao_variaveis.

      lo_vars = NEW zcl_declaracao_variaveis(
        iv_inteiro = 42
        iv_decimal = '3.14'
        iv_texto   = 'Eduardo'
        iv_ativo   = abap_true
      ).

      lo_vars->imprimir_variaveis( io_out = out ).
      lo_vars->set_ativo( abap_false ).
      lo_vars->set_texto( 'Eduardo Editado' ).
      lo_vars->set_decimal( '4.56' ).
      lo_vars->set_inteiro( 25 ).
      out->write( '----' ).
      lo_vars->imprimir_variaveis( io_out = out ).
      out->write( '----' ).
      out->write( lo_vars->get_texto(  ) ).
      out->write( lo_vars->get_app_nome(  ) ).
      out->write( '----' ).

      DATA lo_if_loop TYPE REF TO zcl_controle_fluxo.

      lo_if_loop = NEW zcl_controle_fluxo(  ).

      out->write( lo_if_loop->verificar_idade( lo_vars ) ).
      lo_vars->set_inteiro( 15 ).
      out->write( lo_if_loop->verificar_idade( lo_vars ) ).
      lo_vars->set_inteiro( -2 ).
      out->write( lo_if_loop->verificar_idade( lo_vars ) ).
      out->write( '----' ).

      out->write( lo_if_loop->alterar_status( iv_char = 'A' io_out = out ) ).
      out->write( lo_if_loop->alterar_status( iv_char = 'I' io_out = out ) ).
      out->write( lo_if_loop->alterar_status( iv_char = 'F' io_out = out ) ).
      out->write( lo_if_loop->alterar_status( iv_char = 'B' io_out = out ) ).
      out->write( '----' ).

      lo_if_loop->contador( iv_int = 10 io_out = out ).
      lo_if_loop->contador( iv_int = 3 io_out = out ).
      out->write( '----' ).

      DATA(lo_internal_table) = NEW zcl_internal_table( ).
      lo_internal_table->preencher_tabela( ).
      lo_internal_table->imprimir_tabela( io_out = out ).

  ENDMETHOD.
ENDCLASS.
