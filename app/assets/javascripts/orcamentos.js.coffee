$ ->
    $('#add_item_orcamento').on "click", ->
        $.ajax
            url: '/orcamento/add_item'
            type: 'post'
            dataType: 'script'
            data:
                produto: $('#produto_id').val()
                quantidade: $('#produto_quantidade').val()

    remover_item =(elemento, produto, quantidade) ->
          $.ajax
            url: '/orcamento/remover_item'
            type: 'post'
            dataType: 'json'
            data:
                produto: produto
                quantidade: quantidade
            success: (data) ->
                $('#valor_total').html("<h4>"+data+"</h4>")
                elemento.parentElement.parentElement.remove()
    window.remover_item = remover_item


