$ ->
  $('#salvar_funcionario').on "click", ->
    $('#new_funcionario').validate()
    $('#new_funcionario').submit()

