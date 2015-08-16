$ ->
  $('#salvar_produto').on "click", ->
    $('#new_produto').validate()
    $('#produto_valor_venda').val($('#produto_valor_venda').unmask())
    $('#produto_valor_custo').val($('#produto_valor_custo').unmask())
    $('#new_produto').submit()

  $('.produto_nome_autocomplete').autocomplete
      source: '/produtos/autocomplete.json'
      select: (event, ui) ->
          $('#produto_nome').val(ui.item.label)
          $('#produto_id').val(ui.item.value)
          $('#quantidade_estoque').html(ui.item.quantidade + ' ' + ui.item.unidade)
          $('#preco').html(ui.item.preco)
          false

  $('.produto_nome_autocomplete').on "keydown", ->
    key = event.keyCode || event.charCode
    if( key == 8 || key == 46 )
      $('#produto_nome').val('')
      $('#produto_id').val('')
      $('#quantidade_estoque').html('')
      $('#preco').html('')
      false
