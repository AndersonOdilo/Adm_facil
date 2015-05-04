$ ->
    $('#add_item_venda').on "click", ->
        $.ajax
            url: '/venda/add_item'
            type: 'post'
            dataType: 'script'
            data:
                produto: $('#produto_id').val()
                quantidade: $('#produto_quantidade').val()

    $('#venda_desconto').keyup (e) ->
        valor =  $('#venda_desconto').val()
        parseInt(valor)
        if (valor < 100 && valor > 0)
            $.ajax
                url: '/venda/calcular_desconto'
                type: 'post'
                dataType: 'json'
                data:
                    desconto: valor
                success: (data) ->
                    $('#valor_total_desconto').html(data)
        else
            $('#valor_total_desconto').html('')

    $('#finalizar_pedido'). on "click", ->
        $.ajax
            url: '/venda/finalizar/'
            type: 'post'
            dataType: 'script'
            data:
                forma_pagamento: $('#venda_forma_pagamento_id').val()
                cliente: $('#cliente_id').val()
                entrega: $('#forma_entrega').val()

   remover_item_venda =(elemento, produto, quantidade) ->
      $.ajax
        url: '/venda/remover_item'
        type: 'post'
        dataType: 'json'
        data:
            produto: produto
            quantidade: quantidade
        success: (data) ->
            $('#valor_total').html(data)
            elemento.parentElement.parentElement.remove()
    window.remover_item_venda = remover_item_venda

