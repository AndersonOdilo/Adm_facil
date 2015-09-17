$ ->
  $(document).on 'cocoon:after-insert', (e, insertedItem) ->

    $(".cep").mask("99999-999")

    $('#select_pais').on "change", ->
      id = $(this).val()
      if id
        $.ajax
          url: '/pais/estados/'+id
          dataType: 'json'
          type: 'GET'
          success: (data) ->
            $('#select_estado').empty()
            $('#select_cidade').empty()
            $('#select_rua').empty()
            $('#select_estado').append($("<option/>").attr("value", "").text("Selecione uma estado").select())
            for estado in data
              op = $("<option/>").attr("value", estado.id).text(estado.nome)
              $('#select_estado').append(op)
          error: (data) ->
            alert('erro')

    $('#select_estado').on "change", ->
      id = $(this).val()
      if id
        $.ajax
          url: '/estado/cidades/'+id
          dataType: 'json'
          type: 'GET'
          success: (data) ->
             $('#select_cidade').empty()
             $('#select_rua').empty()
             $('#select_cidade').append($("<option/>").attr("value", "").text("Selecione uma cidade").select())
             for cidade in data
                op = $("<option/>").attr("value", cidade.id).text(cidade.nome)
                $('#select_cidade').append(op)
          error: (data) ->
            alert('erro')
