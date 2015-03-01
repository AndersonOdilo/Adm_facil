$ ->
    $('#add_unidade').on "click", ->
        $('#new_unidade').submit()

    $('#new_unidade').bind "ajax:success", (event, data, status, xhr) ->
        $('#produto_unidade').append($("<option/>").attr("value", data.id).text(data.descricao).attr("selected","selected");)
        $('#nova_unidade').modal('hide')
        $('#new_unidade')[0].reset()