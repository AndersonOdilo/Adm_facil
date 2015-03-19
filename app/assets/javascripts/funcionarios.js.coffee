$ ->
    $('#salvar_funcionario').on "click", ->
        if $('#new_pessoa_fisica').length
            $('#new_pessoa_fisica').validate()
            $('#new_funcionario').validate()
            $('#new_pessoa_fisica').submit()
        else if $('#new_pessoa_juridica').length
            $('#new_pessoa_juridica').validate()
            $('#new_funcionario').validate()
            $('#new_pessoa_juridica').submit()

