$ ->
    $('#add_fornecedor').on "click", ->
        $('#new_pessoa_juridica').submit()
        $('#new_pessoa_juridica').bind "ajax:success", (event, data, status, xhr) ->
            $('#fornecedor_pessoa_id').val(data.id)
            $('#new_fornecedor').submit()