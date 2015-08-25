$ ->
  $('#salvar_fornecedor').on "click", ->
    $('#new_fornecedor').validate()
    $('#new_fornecedor').submit()

