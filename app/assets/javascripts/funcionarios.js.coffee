$ ->
    $('#add_funcionario').on "click", ->
        if ($('#estado_pessoas_fisicas').is(':checked'))
            $('#new_pessoa_fisica').submit()
        else
            $('#new_pessoa_juridica').submit()
