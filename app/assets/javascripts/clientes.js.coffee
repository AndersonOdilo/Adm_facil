$ ->
    $('#add_cliente').on "click", ->
        $('#new_pessoa_fisica').submit()
        $('#new_pessoa_fisica').bind "ajax:success", (event, data, status, xhr) ->
            $('#cliente_pessoa_id').val(data.id)
            $('#new_cliente').submit()
