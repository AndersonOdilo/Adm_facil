$ ->
    $('.cliente_nome_autocomplete').autocomplete
        source: '/clientes/autocomplete.json'
        select: (event, ui) ->
            $('#cliente_nome').val ui.item.label
            $('#cliente_id').val ui.item.value
            false

    $('.produto_nome_autocomplete').autocomplete
        source: '/produtos/autocomplete.json'
        select: (event, ui) ->
            $('#produto_nome').val ui.item.label
            $('#produto_id').val ui.item.value
            $('#quantidade_estoque').html '<h3>' + ui.item.quantidade + ' ' + ui.item.unidade + '</h3>'
            $('#quantidade_estoque_value').val(ui.item.quantidade)
            $('#preco').html '<h3>' + ui.item.preco + '</h3>'
            false

    $('.numero').keypress (event) ->
        tecla = if window.event then event.keyCode else event.which
        if tecla > 47 and tecla < 58
            true
        else
            if tecla != 8
                false
            else
                true


  $.rails.allowAction = (link) ->
    return true unless link.attr('data-confirm')
    $.rails.showConfirmDialog(link)
    false

  $.rails.confirmed = (link) ->
    link.removeAttr('data-confirm')
    link.trigger('click.rails')

  $.rails.showConfirmDialog = (link) ->
    message = link.attr 'data-confirm'
    html = """
           <div class="modal" id="confirmationDialog">
             <div class="modal-dialog">
               <div class="modal-content">
                 <div class="modal-header">
                   <a class="close" data-dismiss="modal">×</a>
                   <h1>Confirmaçao</h1>
                 </div>
                 <div class="modal-body">
                    <h3>#{message}</h3>
                 </div>
                 <div class="modal-footer">
                   <a data-dismiss="modal" class="btn btn-primary">Cancelar</a>
                   <a data-dismiss="modal" class="btn btn-danger confirm">Confirmar</a>
                 </div>
               </div>
             </div>
           </div>
           """
    $(html).modal()
    $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)


