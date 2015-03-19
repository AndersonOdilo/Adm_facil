$ ->
    $('#salvar_fornecedor').on "click", ->
        if $('#new_pessoa_fisica').length
            $('#new_pessoa_fisica').validate()
            $('#new_fornecedor').validate()
            $('#new_pessoa_fisica').submit()
        else if $('#new_pessoa_juridica').length
            $('#new_pessoa_juridica').validate()
            $('#new_fornecedor').validate()
            $('#new_pessoa_juridica').submit()

    $('#new_fornecedor').bind 'ajax:success', (event, data, status, xhr) ->
        $('#produto_fornecedor_id').append $('<option/>').attr('value', data.id).text(data.pessoa.nome).attr('selected', 'selected')
        $('#novo_fornecedor').modal('hide')
