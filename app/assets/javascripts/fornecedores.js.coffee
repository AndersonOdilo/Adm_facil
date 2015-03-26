$ ->
    $('#salvar_fornecedor').on "click", ->
        if $('#new_pessoa_fisica').length
          pessoa = $('#new_pessoa_fisica').valid()
          fornecedor = $('#new_fornecedor').valid()
          if pessoa && fornecedor
            $('#new_pessoa_fisica').submit()
        else if $('#new_pessoa_juridica').length
          pessoa = $('#new_pessoa_juridica').valid()
          fornecedor = $('#new_fornecedor').valid()
          if pessoa && fornecedor
            $('#new_pessoa_juridica').submit()

    $('#new_fornecedor').bind 'ajax:success', (event, data, status, xhr) ->
        $('#produto_fornecedor_id').append $('<option/>').attr('value', data.id).text(data.pessoa.nome).attr('selected', 'selected')
        $('#novo_fornecedor').modal('hide')
