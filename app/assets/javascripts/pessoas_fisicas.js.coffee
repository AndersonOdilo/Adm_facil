$ ->
    $('#new_pessoa_fisica').bind 'ajax:success', (event, data, status, xhr) ->
      $('#pessoa_id').val data.id

      if $('#new_fornecedor').length
        $('#new_fornecedor').submit()

      else if $('#new_cliente').length
        $('#new_cliente').submit()

      else if $('#new_funcionario').length
        $('#new_funcionario').submit()

    $('#new_pessoa_fisica').bind 'ajax:error', (evt, xhr, status, error) ->
      errors = xhr.responseJSON.error
      for message of errors
        alert(errors[message])
        $('#errors ul').append '<li>' + errors[message] + '</li>'


    $(".cpf").mask("999.999.999-99")
    $(".rg").mask("99.999.999-9")
    $(".fone").mask("(99)9999-9999")
