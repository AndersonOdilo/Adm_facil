$ ->
    $('#salvar_fornecedor').on "click", ->
        if $('#new_pessoa_fisica').length
            $('#submit_pessoa_fisica').click()
        else if $('#new_pessoa_juridica').length
            $('#submit_pessoa_juridica').click()

