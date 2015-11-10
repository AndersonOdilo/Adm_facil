$ ->
  $('#salvar_funcionario').on "click", ->
    if $('#new_funcionario').valid()
    	salario = $('#funcionario_salario').maskMoney('unmasked')[0]
    	$('#funcionario_salario').val(salario)
    	$('#new_funcionario').submit()
