$ ->
     $('#add_fornecedor').on "click", ->
        if ($('#estado_pessoas_fisicas').is(':checked'))
            $('#new_pessoa_fisica').submit()
        else
             $('#new_pessoa_juridica').submit()

      $('#new_pessoa_fisica').bind "ajax:success", (event, data, status, xhr) ->
                $('#fornecedor_pessoa_id').val(data.id)
                $('#new_fornecedor').submit()

      $('#new_pessoa_juridica').bind "ajax:success", (event, data, status, xhr) ->
                $('#fornecedor_pessoa_id').val(data.id)
                $('#new_fornecedor').submit()
