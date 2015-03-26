$ ->
    $('#salvar_cliente').on "click", ->
        if $('#new_pessoa_fisica').length
          pessoa = $('#new_pessoa_fisica').valid()
          cliente = $('#new_cliente').valid()
          if pessoa && cliente
            $('#new_pessoa_fisica').submit()
        else if $('#new_pessoa_juridica').length
          pessoa = $('#new_pessoa_juridica').valid()
          cliente = $('#new_cliente').valid()
          if pessoa && cliente
            $('#new_pessoa_juridica').submit()

    $('#new_cliente').bind 'ajax:success', (event, data, status, xhr) ->
        $('#cliente_nome').val(data.pessoa.nome)
        $('#pedido_cliente_id').val(data.id)
        $('#novo_cliente').modal('hide')





