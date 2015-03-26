$ ->
    $('#salvar_funcionario').on "click", ->
        if $('#new_pessoa_fisica').length
          pessoa = $('#new_pessoa_fisica').valid()
          funcionario = $('#new_funcionario').valid()
          if pessoa && funcionario
            $('#new_pessoa_fisica').submit()
        else if $('#new_pessoa_juridica').length
          pessoa = $('#new_pessoa_juridica').valid()
          funcionario = $('#new_funcionario').valid()
          if pessoa && funcionario
            $('#new_pessoa_juridica').submit()

