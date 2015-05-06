$ ->
    $('#add_pessoa_fisica').on "click", ->
      $('#new_pessoa_fisica').click()
      $(this).attr('disabled','disabled')
      $('#add_pessoa_juridica').removeAttr('disabled');
      $('#pessoa_juridica').remove()
      $('#formulario').show()

    $('#add_pessoa_juridica').on "click", ->
      $('#new_pessoa_juridica').click()
      $(this).attr('disabled','disabled')
      $('#add_pessoa_fisica').removeAttr('disabled');
      $('#pessoa_fisica').remove()
      $('#formulario').show()

    $('.numero').keypress (event) ->
        tecla = if window.event then event.keyCode else event.which
        if tecla > 47 and tecla < 58
            true
        else
            if tecla != 8
                false
            else
                true

    $(".cpf").mask("999.999.999-99")

    $(".rg").mask("99.999.999-9")

    $(".fone").mask("(99)9999-9999")

    $(".cnpj").mask("99.999.999/9999-99")

    $(".inscricao_estadual").mask("99999999-99")

    $('.moeda').priceFormat
      prefix: 'R$ ',
      centsSeparator: ',',
      thousandsSeparator: '.'

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


