$ ->
    $('#add_item_venda').on "click", ->
        quantidade = $('#produto_quantidade').val()
        if $('#quantidade_estoque_value').val() >=  quantidade && quantidade > 0
            $.ajax
                url: '/venda/add_item'
                type: 'post'
                dataType: 'script'
                data:
                    produto: $('#produto_id').val()
                    quantidade: $('#produto_quantidade').val()
        else
            alert('aqui')

    remover_item_venda =(elemento, produto, quantidade) ->
          $.ajax
            url: '/venda/remover_item'
            type: 'post'
            dataType: 'json'
            data:
                produto: produto
                quantidade: quantidade
            success: (data) ->
                $('#valor_total').html("<h4>"+data+"</h4>")
                elemento.parentElement.parentElement.remove()
    window.remover_item_venda = remover_item_venda


    $('#finalizar_pedido'). on "click", ->
        if $('#cliente_id').val() != ""
            if $('#venda_forma_pagamento_id').val() == '5'
                $('#pagamento_modal').modal('show')
            else
                $('#new_venda').submit()
        else
           alert('erro')

    $('#numero_parcela').on "change", ->
        $.ajax
            url: '/venda/valor_parcela'
            type: 'post'
            dataType: 'json'
            data:
                entrada: $('#valor_entrada').val()
                numero_parcelas: $('#numero_parcela').val()
            success: (data) ->
                $('#valor_parcela').html(data)

    $('#finalizar_pagamento').on "click", ->
        if $("#numero_parcela").val() != ""
            $('#new_venda').submit()
        else
            alert('nao')


