CLASS zcl_clientes_dao DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS inserir_cliente
      IMPORTING iv_id    TYPE zclientes1-id
                iv_nome  TYPE string
                iv_email TYPE string.
    METHODS buscar_todos
      IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS atualizar
      IMPORTING iv_id    TYPE zclientes1-id
                iv_nome  TYPE string
                iv_email TYPE string.
    METHODS deletar
      IMPORTING iv_id TYPE zclientes1-id.
  PRIVATE SECTION.
    DATA lt_clientes TYPE TABLE OF zclientes1.
    DATA ls_cliente  TYPE zclientes1.
ENDCLASS.

CLASS zcl_clientes_dao IMPLEMENTATION.
    METHOD inserir_cliente.
        ls_cliente-id = iv_id.
        ls_cliente-nome = iv_nome.
        ls_cliente-email = iv_email.
        INSERT zclientes1 FROM @ls_cliente.
        IF sy-subrc = 0.
            COMMIT WORK.
        ENDIF.
    ENDMETHOD.

    METHOD buscar_todos.
        SELECT * FROM zclientes1 INTO TABLE @lt_clientes.
        IF sy-subrc = 0.
            LOOP AT lt_clientes INTO DATA(ls_cliente).
                io_out->WRITE( ls_cliente-id && ' - ' && ls_cliente-nome && ' - ' && ls_cliente-email ).
            ENDLOOP.
        ENDIF.
    ENDMETHOD.

    METHOD atualizar.
      SELECT SINGLE * FROM zclientes1 WHERE id = @iv_id INTO @ls_cliente.
      IF sy-subrc = 0.
        ls_cliente-nome  = iv_nome.
        ls_cliente-email = iv_email.
        UPDATE zclientes1 FROM @ls_cliente.
        IF sy-subrc = 0.
          COMMIT WORK.
        ENDIF.
      ENDIF.
    ENDMETHOD.

    METHOD deletar.
        DELETE FROM zclientes1 WHERE id = @iv_id.
        IF sy-subrc = 0.
            COMMIT WORK.
        ENDIF.
    ENDMETHOD.
ENDCLASS.
