$ ->
  $('#salvar_cliente').on "click", ->
    if $('#new_cliente').valid()
      valor = $('#cliente_limite_credito').maskMoney('unmasked')[0]
      $('#cliente_limite_credito').val(valor)
      $('#new_cliente').submit()

  $('.cliente_nome_autocomplete').autocomplete
    source: '/clientes/autocomplete.json'
    select: (event, ui) ->
      $('#cliente_nome').val(ui.item.value)
      $('#cliente_id').val(ui.item.id)
      false

  $('.cliente_nome_autocomplete').on "keydown", ->
    key = event.keyCode || event.charCode
    if( key == 8 || key == 46 )
      $('#cliente_nome').val('')
      $('#cliente_id').val('')
      false