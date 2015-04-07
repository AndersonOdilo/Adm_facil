$ ->
  $('#despesa_forma_pagamento_id').on "change", ->
    if $(this).val() != "1"
      $('#valor_entrada').removeAttr('disabled')
      $('#numero_parcela').removeAttr('disabled')
      $('#intervalo_parcela').removeAttr('disabled')
    else
      $('#valor_entrada').attr('disabled','disabled')
      $('#numero_parcela').attr('disabled','disabled')
      $('#intervalo_parcela').attr('disabled','disabled')

