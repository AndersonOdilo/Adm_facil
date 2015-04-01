$ ->
    $('#salvar_fornecedor').on "click", ->
      $('#new_fornecedor').validate()
      $('#new_fornecedor').submit()

    $('#new_fornecedor').bind 'ajax:success', (event, data, status, xhr) ->
        $('#produto_fornecedor_id').append $('<option/>').attr('value', data.id).text(data.pessoa.nome).attr('selected', 'selected')
        $('#novo_fornecedor').modal('hide')
