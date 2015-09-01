$ ->
    $('#add_item_venda').on "click", ->
        if $('#produto_id').val()
            if  $('#produto_quantidade').val() > 0
                $.ajax
                    url: '/pedido/add_item'
                    type: 'post'
                    dataType: 'script'
                    data:
                        produto: $('#produto_id').val()
                        quantidade: $('#produto_quantidade').val()
            else 
                sweetAlert('Quantidade deve ser maior que 0')
        else
            sweetAlert('Selecione um Produto')

    $('#pedido_desconto').keyup (e) ->
        valor =  $(this).val()
        parseInt(valor)
        if (valor < 100 && valor > 0)
            $.ajax
                url: '/pedido/calcular_desconto'
                type: 'post'
                dataType: 'json'
                data:
                    desconto: valor
                success: (data) ->
                    $('#valor_total_desconto').html(accounting.formatMoney(data, "R$", 2, ".", ","))
        else
            $('#valor_total_desconto').html('')

    remover_item_venda =(elemento, produto, quantidade) ->
      $.ajax
        url: '/pedido/remover_item'
        type: 'post'
        dataType: 'json'
        data:
            produto: produto
            quantidade: quantidade
        success: (data) ->
            $('#valor_total').html(accounting.formatMoney(data, "R$", 2, ".", ","))
            elemento.parentElement.parentElement.remove()
    window.remover_item_venda = remover_item_venda

    $('#finalizar_pedido'). on "click", ->
        if $('#cliente_id').val()
            $.ajax
                url: '/pedido/finalizar/'
                type: 'post'
                dataType: 'script'
                data:
                    forma_pagamento: $('#pedido_forma_pagamento_id').val()
                    cliente: $('#cliente_id').val()
                    entrega: $('#forma_entrega').val()
        else
            sweetAlert('Busque ou cadastre um cliente')