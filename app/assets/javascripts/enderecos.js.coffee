$ ->
    $('#nome_estado').on "change", ->
        id = $('#nome_estado').val()
        if id != ""
            $.ajax
              url: '/estado/cidades/'+id
              dataType: 'json'
              type: 'GET'
              success: (data) ->
                 $('#nome_cidade').empty()
                 $('#nome_bairro').empty()
                 $('#nome_cidade').append($("<option/>").attr("value", "").text("Selecione uma cidade").select())
                 for cidade in data
                    op = $("<option/>").attr("value", cidade.id).text(cidade.nome)
                    $('#nome_cidade').append(op)
              error: (data) ->
                alert('erro')

    $('#nome_cidade').on "change", ->
        id = $('#nome_cidade').val()
        if id != ""
            $.ajax
              url: '/cidade/bairros/'+id
              dataType: 'json'
              type: 'GET'
              success: (data) ->
                 $('#nome_bairro').empty()
                 $('#nome_bairro').append($("<option/>").attr("value", "").text("Selecione um bairro").select())
                 for bairro in data
                    op = $("<option/>").attr("value", bairro.id).text(bairro.nome)
                    $('#nome_bairro').append(op)
              error: (data) ->
                alert('erro')