$ ->
    $('#add_funcionario').on "click", ->
        if ($('#estado_pessoas_fisicas').is(':checked'))
            $('#new_pessoa_fisica').submit()
        else
            $('#new_pessoa_juridica').submit()

    $('#new_pessoa_fisica').bind "ajax:success", (event, data, status, xhr) ->
            $('#funcionario_pessoa_id').val(data.id)
            $('#new_funcionario').submit()

    $('#new_pessoa_juridica').bind "ajax:success", (event, data, status, xhr) ->
            $('#funcionario_pessoa_id').val(data.id)
            $('#new_funcionario').submit()
