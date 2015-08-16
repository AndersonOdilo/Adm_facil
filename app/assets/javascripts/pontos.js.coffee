$ ->
  $("#chaveiro").on "keypress", ->
    if $(this).val().length == 10
      $.ajax
        url: '/pontos/registrar'
        type: 'post'
        dataType: 'json'
        data:
          chave: $(this).val()
        success: (data) ->
          $("#chaveiro").val("")
          alert(data)
