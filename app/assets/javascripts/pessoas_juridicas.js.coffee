$ ->
    $('#new_pessoa_juridica').bind 'ajax:success', (event, data, status, xhr) ->
      $('#pessoa_id').val data.id

      if $('#new_fornecedor').length
        $('#new_fornecedor').submit()

      else if $('#new_cliente').length
        $('#new_cliente').submit()

      else if $('#new_funcionario').length
        $('#new_funcionario').submit()

