$ ->
    $('#salvar_produto').on "click", ->
      $('#new_produto').validate()
      $('#produto_valor_venda').val($('#produto_valor_venda').unmask())
      $('#produto_valor_custo').val($('#produto_valor_custo').unmask())
      $('#new_produto').submit()

    $('#produto_valor_custo').priceFormat
      prefix: 'R$ ',
      centsSeparator: ',',
      thousandsSeparator: '.'

    $('#produto_valor_venda').priceFormat
      prefix: 'R$ ',
      centsSeparator: ',',
      thousandsSeparator: '.'

