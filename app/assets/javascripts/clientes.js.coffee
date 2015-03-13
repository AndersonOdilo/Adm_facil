$ ->
    $('#salvar_cliente').on "click", ->
        if $('#new_pessoa_fisica').length
            $('#submit_pessoa_fisica').click()
        else if $('#new_pessoa_juridica').length
            $('#submit_pessoa_juridica').click()

    $('#new_cliente').bind 'ajax:success', (event, data, status, xhr) ->
        $('#cliente_nome').val(data.pessoa.nome)
        $('#pedido_cliente_id').val(data.id)
        $('#novo_cliente').modal('hide')





