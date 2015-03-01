$ ->
    $('#add_cargo').on "click", ->
        $('#new_cargo').submit()

    $('#new_cargo').bind "ajax:success", (event, data, status, xhr) ->
        $('#funcionario_cargo').append($("<option/>").attr("value", data.id).text(data.descricao).attr("selected","selected");)
        $('#novo_cargo').modal('hide')
        $('#new_cargo')[0].reset()