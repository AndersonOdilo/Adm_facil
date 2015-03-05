// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui.min
//= require jquery.turbolinks
//= require jquery.mask.min
//= require jquery_nested_form
//= require turbolinks
//= require_tree .
//= require bootstrap.min

var ready;
ready = (function() {
  $("#produto_nome").autocomplete({
    source: '/produtos/autocomplete.json',
    select: function( event, ui ) {
        $( "#produto_nome" ).val( ui.item.label );
        $( "#produto_id" ).val( ui.item.value );
        $("#produto_preco").val( ui.item.preco );
        $("#produto_estoque").val( ui.item.quantidade );
        return false;
    }
  });
  $("#cliente_nome").autocomplete({
    source: '/clientes/autocomplete.json',
    select: function( event, ui ) {
        $( "#cliente_nome" ).val( ui.item.label );
        $( "#pedido_cliente_id" ).val( ui.item.value );
        return false;
    }
  });
  $( "#datepicker" ).datepicker({
    dateFormat : 'yy-mm-dd',
    changeMonth: true,
    changeYear: true
  });
  $("#pessoa_juridica_cnpj").mask("99.999.999/9999-99");
  $("#pessoa_juridica_inscricao_estadual").mask("99999999-99");
  $("#pessoa_fisica_cpf").mask("999.999.999-99");
  $("#pessoa_fisica_rg").mask("99.999.999-9");
});

$(document).ready(ready);
$(document).on('page:load', ready);
