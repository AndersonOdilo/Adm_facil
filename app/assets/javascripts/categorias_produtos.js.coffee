$ ->
    $('#add_categoria').on "click", ->
        $('#new_categoria_produto').submit()

    $('#new_categoria_produto').bind "ajax:success", (event, data, status, xhr) ->
        $('#produto_categoria_produto').append($("<option/>").attr("value", data.id).text(data.descricao).attr("selected","selected");)
        $('#nova_categoria').modal('hide')
        $('#new_categoria_produto')[0].reset()
