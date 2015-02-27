$ ->
    $('#estado_pessoas_fisicas').on "click", ->
        $('#pessoa_fisica').show()
        $('#pessoa_juridica').hide()
        $('#new_pessoa_juridica')[0].reset()
    $('#estado_pessoas_juridicas').on "click", ->
        $('#pessoa_fisica').hide()
        $('#pessoa_juridica').show()
        $('#new_pessoa_fisica')[0].reset()