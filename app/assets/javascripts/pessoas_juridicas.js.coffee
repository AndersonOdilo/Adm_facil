$ ->
    $('#new_pessoa_juridica').bind 'ajax:success', (event, data, status, xhr) ->
      $('#pessoa_id').val data.id

      if $('#new_fornecedor').length
        $('#new_fornecedor').submit()

        if $('#novo_fornecedor').length
            $('#produto_fornecedor_id').append $('<option/>').attr('value', data.id).text(data.nome).attr('selected', 'selected')
            $('#novo_fornecedor').modal('hide')

      else if $('#new_cliente').length
        $('#new_cliente').submit()

        if $('#novo_cliente').length
          $('#cliente_nome').val(data.nome)
          $('#pedido_cliente_id').val(data.id)
          $('#novo_cliente').modal('hide')

      else if $('#new_funcionario').length
        $('#new_funcionario').submit()
