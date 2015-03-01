$ ->
    $('#add_cliente').on "click", ->
        if ($('#estado_pessoas_fisicas').is(':checked'))
            $('#new_pessoa_fisica').submit()
        else
            $('#new_pessoa_juridica').submit()

    $('#edit_cliente_fisica').on "click", ->
        $('#new_pessoa_fisica').submit()

    $('#edit_cliente_juridica').on "click", ->
        $('#new_pessoa_juridica').submit()




