$ ->
  $('#salvar_cliente').on "click", ->
    $('#new_cliente').validate()
    $('#new_cliente').submit()

  $('#new_cliente').bind 'ajax:success', (event, data, status, xhr) ->
    $('#cliente_nome').val(data.pessoa.nome)
    $('#pedido_cliente_id').val(data.id)
    $('#novo_cliente').modal('hide')





