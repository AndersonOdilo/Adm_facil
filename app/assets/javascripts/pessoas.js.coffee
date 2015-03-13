$ ->
    $('#estado_pessoas_fisicas').on "click", ->
            $.ajax
                url: '/pessoas_fisicas/new.js'
                type: 'GET'
                success: (data) ->
                    $('#formulario').show()

    $('#estado_pessoas_juridicas').on "click", ->
         $.ajax
            url: '/pessoas_juridicas/new.js'
            type: 'GET'
            success: (data) ->
                $('#formulario').show()

    $('.datepicker').datepicker
        dateFormat: 'yy-mm-dd'
        changeMonth: true
        changeYear: true

    $('#cliente_nome').autocomplete
        source: '/clientes/autocomplete.json'
        select: (event, ui) ->
            $('#cliente_nome').val ui.item.label
            $('#cliente_id').val ui.item.value
            false

    $('#produto_nome').autocomplete
        source: '/produtos/autocomplete.json'
        select: (event, ui) ->
            $('#produto_nome').val ui.item.label
            $('#produto_id').val ui.item.value
            $('#quantidade_estoque').html '<h3>' + ui.item.quantidade + ' ' + ui.item.unidade + '</h3>'
            $('#preco').html '<h3>' + ui.item.preco + '</h3>'
            false

    $('.numero').keypress (event) ->
        tecla = if window.event then event.keyCode else event.which
        if tecla > 47 and tecla < 58
            true
        else
            if tecla != 8
                false
            else
                true


