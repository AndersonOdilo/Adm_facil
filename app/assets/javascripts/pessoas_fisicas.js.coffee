$ ->
    $('#new_pessoa_fisica').bind 'ajax:success', (event, data, status, xhr) ->
      $('#pessoa_id').val data.id

      if $('#new_fornecedor').length
        $('#new_fornecedor').submit()

      else if $('#new_cliente').length
        $('#new_cliente').submit()

      else if $('#new_funcionario').length
        $('#new_funcionario').submit()

    $(".cpf").mask("999.999.999-99");
    $(".rg").mask("99.999.999-9");
    $(".fone").mask("(99)9999-9999");
