$ ->
    $('#add_marca').on "click", ->
        $('#new_marca').submit()

    $('#new_marca').bind "ajax:success", (event, data, status, xhr) ->
        $('#produto_marca').append($("<option/>").attr("value", data.id).text(data.nome).attr("selected","selected");)
        $('#nova_marca').modal('hide')
        $('#new_marca')[0].reset()