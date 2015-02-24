$ ->
    $('#select_estado').on "change", ->
        id = $('#select_estado').val()
        if id != ""
            $.ajax
              url: '/estado/cidades/'+id
              dataType: 'json'
              type: 'GET'
              success: (data) ->
                 $('#select_cidade').empty()
                 $('#select_bairro').empty()
                 $('#select_cidade').append($("<option/>").attr("value", "").text("Selecione uma cidade").select())
                 for cidade in data
                    op = $("<option/>").attr("value", cidade.id).text(cidade.nome)
                    $('#select_cidade').append(op)
              error: (data) ->
                alert('erro')

    $('#select_cidade').on "change", ->
        id = $('#select_cidade').val()
        if id != ""
            $.ajax
              url: '/cidade/bairros/'+id
              dataType: 'json'
              type: 'GET'
              success: (data) ->
                 $('#select_bairro').empty()
                 $('#select_bairro').append($("<option/>").attr("value", "").text("Selecione um bairro").select())
                 for bairro in data
                    op = $("<option/>").attr("value", bairro.id).text(bairro.nome)
                    $('#select_bairro').append(op)
              error: (data) ->
                alert('erro')
