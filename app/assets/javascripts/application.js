//= require jquery
//= require jquery-ui.min
//= require jquery_ujs
//= require jquery.mask.min
//= require jquery.validate.min
//= require jquery.dataTables
//= require jquery.turbolinks
//= require jquery.maskMoney
//= require dataTables.bootstrap
//= require turbolinks
//= require accounting.min
//= require sweetalert.min
//= require cocoon
//= require demo
//= require app.min
//= require_tree .
//= require bootstrap.min
//= require pace

var ready = (function() {
  jQuery.extend(jQuery.validator.messages, {
        required: "Campo obrigatorio.",
        remote: "Please fix this field.",
        email: "Informe um e-mail valido.",
        url: "Please enter a valid URL.",
        date: "Data deve ser",
        dateISO: "Please enter a valid date (ISO).",
        number: "Please enter a valid number.",
        digits: "Please enter only digits.",
        creditcard: "Please enter a valid credit card number.",
        equalTo: "Please enter the same value again.",
        accept: "Please enter a value with a valid extension.",
        maxlength: jQuery.validator.format("Please enter no more than {0} characters."),
        minlength: jQuery.validator.format("Tamanho de {0} caracteres."),
        rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
        range: jQuery.validator.format("Please enter a value between {0} and {1}."),
        max: jQuery.validator.format("O valor deve ser menor ou igual a {0}."),
        min: jQuery.validator.format("O tamanho é de {0} caracteres.")
  });

  $.validator.setDefaults({
    highlight: function(element) {
      $(element).closest('.form-group').addClass('has-error');
    },
    unhighlight: function(element) {
      $(element).closest('.form-group').removeClass('has-error');
    },
    errorElement: 'span',
    errorClass: 'help-block',
    errorPlacement: function(error, element) {
      if(element.parent('.input-group').length) {
        error.insertAfter(element.parent());
      } else {
        error.insertAfter(element);
      }
    }
  });

  $('#tabela').DataTable({
    "language": {
        "sEmptyTable": "Nenhum registro encontrado",
        "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
        "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
        "sInfoFiltered": "(Filtrados de _MAX_ registros)",
        "sInfoPostFix": "",
        "sInfoThousands": ".",
        "sLengthMenu": "_MENU_ resultados por página",
        "sLoadingRecords": "Carregando...",
        "sProcessing": "Processando...",
        "sZeroRecords": "Nenhum registro encontrado",
        "sSearch": "Pesquisar",
        "oPaginate": {
            "sNext": "Próximo",
            "sPrevious": "Anterior",
            "sFirst": "Primeiro",
            "sLast": "Último"
        },
        "oAria": {
            "sSortAscending": ": Ordenar colunas de forma ascendente",
            "sSortDescending": ": Ordenar colunas de forma descendente"
        }
    },
    "bDestroy": true
  });

  var url = window.location;
  $('ul.sidebar-menu a[href="'+ url +'"]').parent().addClass('active');
  $('ul.sidebar-menu a').filter(function() {
    return this.href == url;
  }).parent().addClass('active');

  $.rails.allowAction = function(link) {
    if (!link.attr('data-confirm')) {
        return true;
    }
    $.rails.showConfirmDialog(link);
    return false;
  };

  $.rails.confirmed = function(link) {
    link.removeAttr('data-confirm');
    return link.trigger('click.rails');
  };

  $.rails.showConfirmDialog = function(link) {
    var html, message;
    message = link.attr('data-confirm');
    html = "<div class=\"modal\" id=\"confirmationDialog\">\n  <div class=\"modal-dialog\">\n    <div class=\"modal-content\">\n      <div class=\"modal-header\">\n        <a class=\"close\" data-dismiss=\"modal\">×</a>\n        <h1>Confirmaçao</h1>\n      </div>\n      <div class=\"modal-body\">\n         <h3>" + message + "</h3>\n      </div>\n      <div class=\"modal-footer\">\n        <a data-dismiss=\"modal\" class=\"btn btn-primary\">Cancelar</a>\n        <a data-dismiss=\"modal\" class=\"btn btn-danger confirm\">Confirmar</a>\n      </div>\n    </div>\n  </div>\n</div>";
    $(html).modal();
    return $('#confirmationDialog .confirm').on('click', function() {
      return $.rails.confirmed(link);
    });
  };

  $('.numero').keypress(function(event) {
    var tecla;
    tecla = window.event ? event.keyCode : event.which;
    if (tecla > 47 && tecla < 58) {
      return true;
    } else {
        if (tecla !== 8) {
          return false;
        } else {
          return true;
        }
    }
  });

});

$(document).ready(ready);
$(document).on('page:load', ready);
