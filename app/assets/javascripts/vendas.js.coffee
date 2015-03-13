$ ->
    $('#add_item_venda').on "click", ->
        $.ajax
            url: '/venda/add_item'
            type: 'post'
            dataType: 'script'
            data:
                produto: $('#produto_id').val()
                quantidade: $('#produto_quantidade').val()

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


