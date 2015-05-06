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
            $('#quantidade_estoque').html('<h3>' + ui.item.quantidade + ' ' + ui.item.unidade + '</h3>')
            $('#preco').html('<h3>' + ui.item.preco + '</h3>')
            false


