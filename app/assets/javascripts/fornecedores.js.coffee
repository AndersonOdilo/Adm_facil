$ ->
    $('#salvar_fornecedor').on "click", ->
        if $('#new_pessoa_fisica').length
            $('#submit_pessoa_fisica').click()
        else if $('#new_pessoa_juridica').length
            $('#submit_pessoa_juridica').click()

    $('#new_fornecedor').bind 'ajax:success', (event, data, status, xhr) ->
        $('#produto_fornecedor_id').append $('<option/>').attr('value', data.id).text(data.pessoa.nome).attr('selected', 'selected')
        $('#novo_fornecedor').modal('hide')
