$ ->
  $('#salvar_cliente').on "click", ->
    $('#new_cliente').validate()
    $('#cliente_limite_credito').val($('#cliente_limite_credito').unmask())
    $('#new_cliente').submit()

  $('#new_cliente').bind 'ajax:success', (event, data, status, xhr) ->
    $('#cliente_nome').val(data.pessoa.nome)
    $('#pedido_cliente_id').val(data.id)
    $('#novo_cliente').modal('hide')

  $('#cliente_limite_credito').priceFormat
    prefix: 'R$ ',
    centsSeparator: ',',
    thousandsSeparator: '.'





