$ ->
    $('#salvar_cliente').on "click", ->
        if $('#new_pessoa_fisica').length
            $('#new_pessoa_fisica').validate()
            $('#new_cliente').validate()
            $('#new_pessoa_fisica').submit()
        else if $('#new_pessoa_juridica').length
            $('#new_pessoa_juridica').validate()
            $('#new_cliente').validate()
            $('#new_pessoa_juridica').submit()

    $('#new_cliente').bind 'ajax:success', (event, data, status, xhr) ->
        $('#cliente_nome').val(data.pessoa.nome)
        $('#pedido_cliente_id').val(data.id)
        $('#novo_cliente').modal('hide')





