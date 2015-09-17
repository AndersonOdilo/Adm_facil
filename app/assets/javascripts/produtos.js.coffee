$ ->
  $('#salvar_produto').on "click", ->
    $('#new_produto').validate()
    $('#new_produto').submit()

  $('.produto_nome_autocomplete').autocomplete
      source: '/produtos/autocomplete.json'
      select: (event, ui) ->
          $('#produto_nome').val(ui.item.value)
          $('#produto_id').val(ui.item.id)
          $('#quantidade_estoque').html(ui.item.quantidade + ' ' + ui.item.unidade)
          $('#preco').html(accounting.formatMoney(ui.item.preco, "R$", 2, ".", ","))
          false

  $('.produto_nome_autocomplete').on "keydown", ->
    key = event.keyCode || event.charCode
    if( key == 8 || key == 46 )
      $('#produto_nome').val('')
      $('#produto_id').val('')
      $('#quantidade_estoque').html('')
      $('#preco').html('')
      false

  $('#filtro-produtos').on "change", ->
    window.location.href = '/produtos'+$(this).val()
