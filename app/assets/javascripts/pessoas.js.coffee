$ ->
    $('#estado_pessoas_fisicas').on "click", ->
            $.ajax
                url: '/pessoas_fisicas/new.js'
                type: 'GET'
                success: (data) ->
                    $('#pessoa_juridica').hide()
                    $('#pessoa_fisica').show()
                    $('#funcionario').show()

    $('#estado_pessoas_juridicas').on "click", ->
         $.ajax
            url: '/pessoas_juridicas/new.js'
            type: 'GET'
            success: (data) ->
                $('#pessoa_fisica').hide()
                $('#pessoa_juridica').show()
                $('#funcionario').show()

