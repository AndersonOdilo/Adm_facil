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

