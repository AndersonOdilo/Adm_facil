$ ->
  $('#salvar_funcionario').on "click", ->
    $('#new_funcionario').validate()
    $('#funcionario_salario').val($('#funcionario_salario').unmask())
    $('#new_funcionario').submit()

  $('#funcionario_salario').priceFormat
    prefix: 'R$ ',
    centsSeparator: ',',
    thousandsSeparator: '.'