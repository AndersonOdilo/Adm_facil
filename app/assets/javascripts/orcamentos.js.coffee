$ ->
    $('#add_item_orcamento').on "click", ->
        $.ajax
            url: '/orcamento/add_item'
            type: 'post'
            dataType: 'script'
            data:
                produto: $('#produto_id').val()
                quantidade: $('#produto_quantidade').val()

    remover_item =(elemento) ->
        elemento.parentElement.parentElement.remove()
    window.remover_item = remover_item


