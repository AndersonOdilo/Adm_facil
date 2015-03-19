$ ->
    $('#salvar_produto').on "click", ->
        $('#new_produto').validate()
        $('#new_produto').submit()
