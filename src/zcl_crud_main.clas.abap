CLASS zcl_crud_main DEFINITION
  PUBLIC FINAL CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_crud_main IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
        DATA(lo_crud) = NEW zcl_clientes_dao( ).

      lo_crud->inserir_cliente( iv_id = '00000001' iv_nome = 'Eduardo'  iv_email = 'eduardo@email.com' ).
      lo_crud->inserir_cliente( iv_id = '00000002' iv_nome = 'João'     iv_email = 'joao@email.com' ).
      lo_crud->inserir_cliente( iv_id = '00000003' iv_nome = 'Maria'    iv_email = 'maria@email.com' ).
      lo_crud->inserir_cliente( iv_id = '00000004' iv_nome = 'Pedro'    iv_email = 'pedro@email.com' ).
      lo_crud->inserir_cliente( iv_id = '00000005' iv_nome = 'Ana'      iv_email = 'ana@email.com' ).
      lo_crud->inserir_cliente( iv_id = '00000006' iv_nome = 'Carlos'   iv_email = 'carlos@email.com' ).
      lo_crud->inserir_cliente( iv_id = '00000007' iv_nome = 'Fernanda' iv_email = 'fernanda@email.com' ).
      lo_crud->inserir_cliente( iv_id = '00000008' iv_nome = 'Lucas'    iv_email = 'lucas@email.com' ).
      lo_crud->inserir_cliente( iv_id = '00000009' iv_nome = 'Juliana'  iv_email = 'juliana@email.com' ).
      lo_crud->inserir_cliente( iv_id = '00000010' iv_nome = 'Rafael'   iv_email = 'rafael@email.com' ).

      out->write( '--- Clientes inseridos! ---' ).
      lo_crud->buscar_todos( io_out = out ).

      lo_crud->atualizar( iv_id = '00000008' iv_nome = 'Lucas Editado'    iv_email = 'lucas123@email.com' ).
      lo_crud->atualizar( iv_id = '00000009' iv_nome = 'Juliana Editado'  iv_email = 'juliana321@email.com' ).
      lo_crud->atualizar( iv_id = '00000010' iv_nome = 'Rafael Editado'   iv_email = 'rafael435@email.com' ).
      out->write( '--- Clientes atualizados! ---' ).
      lo_crud->buscar_todos( io_out = out ).

      lo_crud->atualizar( iv_id = '00000019' iv_nome = 'Rafael Editado'   iv_email = 'rafael435@email.com' ).
      out->write( '--- Clientes não existente de teste do UPDATE! ---' ).
      lo_crud->buscar_todos( io_out = out ).

      lo_crud->deletar( iv_id = '00000002' ).
      lo_crud->deletar( iv_id = '00000005' ).
      out->write( '--- Clientes deletados! ---' ).
      lo_crud->buscar_todos( io_out = out ).

      lo_crud->deletar( iv_id = '00000019' ).
      out->write( '--- Clientes não existente de teste do DELETE! ---' ).
      lo_crud->buscar_todos( io_out = out ).
    ENDMETHOD.
ENDCLASS.
