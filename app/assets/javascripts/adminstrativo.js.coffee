$ ->
	$('#gerar_relatorio').on "click", ->
		data_inicial =  $('#data_inicial').val()
		data_final = $('#data_final').val()
		if data_inicial && data_final
			if data_inicial <= data_final
		    $.ajax
		      url: '/financeiro/relatorio'
		      dataType: 'script'
		      type: 'POST'
		      data:
		      	data_inicial: data_inicial
		      	data_final: data_final
		      success: (data) ->
		      	$('#imprimir_relatorio').attr('href', '/financeiro/relatorio.pdf?data_inicial='+data_inicial+'&data_final='+data_final)
		      	$('#imprimir_relatorio').show()
		      error: (data) ->
		      	$('#imprimir_relatorio').attr('href', '')
		      	$('#imprimir_relatorio').hide()
		  else
		  	sweetAlert('A data inicial deve ser menor que a final')
		else
			sweetAlert('Preencha os dois campos')
