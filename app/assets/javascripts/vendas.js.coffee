$ ->
    $('#add_item_venda').on "click", ->
        quantidade = $('#produto_quantidade').val()
        parseInt(quantidade)
        if parseInt($('#quantidade_estoque_value').val()) >=  quantidade && quantidade > 0
            $.ajax
                url: '/venda/add_item'
                type: 'post'
                dataType: 'script'
                data:
                    produto: $('#produto_id').val()
                    quantidade: $('#produto_quantidade').val()
        else
            alert('Nao a estoque')

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

    $('#numero_parcela').on "change", ->
        window.calcular_parcela($('#valor_entrada').val(), $('#numero_parcela').val())

    $('#valor_entrada').keyup ->
        window.calcular_parcela($('#valor_entrada').val(), $('#numero_parcela').val())

    $('#finalizar_pedido'). on "click", ->
        if $('#cliente_id').val() != ""
            if $('#venda_forma_pagamento_id').val() == '5'
                $('#pagamento_modal').modal('show')
            else
                $('#new_venda').submit()
        else
           alert('Busque ou cadastre um cliente')


    $('#finalizar_pagamento').on "click", ->
        if $("#numero_parcela").val() != ""
            $('#new_venda').submit()
        else
            alert('Selecione o numero de parcelas')


    calcular_parcela =(valor_entrada, numero_parcelas) ->
        $.ajax
            url: '/venda/valor_parcela'
            type: 'post'
            dataType: 'json'
            data:
                entrada: valor_entrada
                numero_parcelas: numero_parcelas
            success: (data) ->
                $('#valor_parcela').html(data)
    window.calcular_parcela = calcular_parcela

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

