$ ->
    $('#add_item_orcamento').on "click", ->
        if $('#produto_id').val()
            if  $('#produto_quantidade').val() > 0
                $.ajax
                    url: '/orcamento/add_item'
                    type: 'post'
                    dataType: 'script'
                    data:
                        produto: $('#produto_id').val()
                        quantidade: $('#produto_quantidade').val()
            else 
                sweetAlert('Quantidade deve ser maior que 0')
        else
            sweetAlert('Selecione um Produto')

    remover_item =(elemento, produto, quantidade) ->
          $.ajax
            url: '/orcamento/remover_item'
            type: 'post'
            dataType: 'json'
            data:
                produto: produto
                quantidade: quantidade
            success: (data) ->
                $('#valor_total').html(accounting.formatMoney(data, "R$", 2, ".", ","))
                elemento.parentElement.parentElement.remove()
    window.remover_item = remover_item

    $('#orcamento_desconto').keyup (e) ->
        valor =  $('#orcamento_desconto').val()
        parseInt(valor)
        if (valor < 100 && valor > 0)
            $.ajax
                url: '/orcamento/calcular_desconto'
                type: 'post'
                dataType: 'json'
                data:
                    desconto: valor
                success: (data) ->
                    $('#valor_total_desconto').html(accounting.formatMoney(data, "R$", 2, ".", ","))
        else
            $('#valor_total_desconto').html('')


