$ ->
    $('#add_cliente').on "click", ->
        if ($('#estado_pessoas_fisicas').is(':checked'))
            $('#submit_pessoa_fisica').click()
        else
            $('#submit_pessoa_juridica').click()

    $('#edit_cliente').on "click", ->
        if $('#new_pessoa_fisica').length
            $('#submit_pessoa_fisica').click()
        else if $('#new_pessoa_juridica').length
            $('#submit_pessoa_juridica').click()




