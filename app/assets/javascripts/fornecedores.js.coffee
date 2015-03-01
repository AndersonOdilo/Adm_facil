$ ->
    $('#add_fornecedor').on "click", ->
        if ($('#estado_pessoas_fisicas').is(':checked'))
            $('#new_pessoa_fisica').submit()
        else
             $('#new_pessoa_juridica').submit()

    $('#edit_fornecedor_fisica').on "click", ->
        $('#new_pessoa_fisica').submit()

    $('#edit_fornecedor_juridica').on "click", ->
        $('#new_pessoa_juridica').submit()

