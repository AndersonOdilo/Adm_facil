$ ->
  $('#salvar_cliente').on "click", ->
    $('#new_cliente').validate()
    $('#cliente_limite_credito').val($('#cliente_limite_credito').unmask())
    $('#new_cliente').submit()

  $('.cliente_nome_autocomplete').autocomplete
    source: '/clientes/autocomplete.json'
    select: (event, ui) ->
      $('#cliente_nome').val(ui.item.label)
      $('#cliente_id').val(ui.item.value)
      false

  $('.cliente_nome_autocomplete').on "keydown", ->
    key = event.keyCode || event.charCode
    if( key == 8 || key == 46 )
      $('#cliente_nome').val('')
      $('#cliente_id').val('')
      false