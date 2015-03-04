$ ->
    $('#new_pessoa_fisica').bind 'ajax:success', (event, data, status, xhr) ->
      $('#pessoa_id').val data.id
      if $('#new_fornecedor').length
        $('#new_fornecedor').submit()
        if $('#novo_fornecedor').length
            $('#produto_fornecedor').append $('<option/>').attr('value', data.id).text(data.nome).attr('selected', 'selected')
            $('#novo_fornecedor').modal('hide')
      else if $('#new_cliente').length
        $('#new_cliente').submit()
        if $('#novo_cliente').length
          $('#pedido_cliente').append $('<option/>').attr('value', data.id).text(data.nome).attr('selected', 'selected')
      else if $('#new_funcionario').length
        $('#new_funcionario').submit()

