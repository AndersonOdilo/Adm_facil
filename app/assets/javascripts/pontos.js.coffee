$ ->
  $("#chaveiro").keypress (e) ->
    tecla = if e.keyCode then e.keyCode else e.which
    if tecla == 13
      $.ajax
        url: '/pontos/registrar'
        type: 'post'
        dataType: 'json'
        data:
          chave: $(this).val()
        success: (data) ->
          $("#chaveiro").val("")
          sweetAlert(data);
    return

