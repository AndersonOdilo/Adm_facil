$ ->
    $('#select_estado').on "change", ->
        id = $(this).val()
        if id != ""
            $.ajax
              url: '/estado/cidades/'+id
              dataType: 'json'
              type: 'GET'
              success: (data) ->
                 $('#select_cidade').empty()
                 $('#select_bairro').empty()
                 $('#select_rua').empty()
                 $('#select_cidade').append($("<option/>").attr("value", "").text("Selecione uma cidade").select())
                 for cidade in data
                    op = $("<option/>").attr("value", cidade.id).text(cidade.nome)
                    $('#select_cidade').append(op)
              error: (data) ->
                alert('erro')

    $('#select_cidade').on "change", ->
        id = $(this).val()
        if id != ""
            $.ajax
              url: '/cidade/bairros/'+id
              dataType: 'json'
              type: 'GET'
              success: (data) ->
                 $('#select_bairro').empty()
                 $('#select_rua').empty()
                 $('#select_bairro').append($("<option/>").attr("value", "").text("Selecione um bairro").select())
                 for bairro in data
                    op = $("<option/>").attr("value", bairro.id).text(bairro.nome)
                    $('#select_bairro').append(op)
              error: (data) ->
                alert('erro')

     $('#select_bairro').on "change", ->
        id = $(this).val()
        if id != ""
            $.ajax
              url: '/bairro/ruas/'+id
              dataType: 'json'
              type: 'GET'
              success: (data) ->
                 $('#select_rua').empty()
                 $('#select_rua').append($("<option/>").attr("value", "").text("Selecione um rua").select())
                 for rua in data
                    op = $("<option/>").attr("value", rua.id).text(rua.nome)
                    $('#select_rua').append(op)
              error: (data) ->
                alert('erro')