$ ->
    $('#add_fornecedor').on "click", ->
        if ($('#estado_pessoas_fisicas').is(':checked'))
            $('#new_pessoa_fisica').submit()
        else
             $('#new_pessoa_juridica').submit()

    $('#edit_fornecedor').on "click", ->
        if $('#new_pessoa_fisica').length
            $('#new_pessoa_fisica').submit()
        else if $('#new_pessoa_juridica').length
            $('#new_pessoa_juridica').submit()

