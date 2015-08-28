//= require jquery
//= require jquery-ui.min
//= require jquery_ujs
//= require jquery.mask.min
//= require jquery.validate.min
//= require jquery.dataTables
//= require dataTables.bootstrap
//= require accounting.min
//= require jquery.turbolinks
//= require turbolinks
//= require cocoon
//= require_tree .
//= require bootstrap.min
//= require pace

var ready = (function() {
  jQuery.extend(jQuery.validator.messages, {
        required: "Campo obrigatorio.",
        remote: "Please fix this field.",
        email: "Please enter a valid email address.",
        url: "Please enter a valid URL.",
        date: "Data deve ser",
        dateISO: "Please enter a valid date (ISO).",
        number: "Please enter a valid number.",
        digits: "Please enter only digits.",
        creditcard: "Please enter a valid credit card number.",
        equalTo: "Please enter the same value again.",
        accept: "Please enter a value with a valid extension.",
        maxlength: jQuery.validator.format("Please enter no more than {0} characters."),
        minlength: jQuery.validator.format("Please enter at least {0} characters."),
        rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
        range: jQuery.validator.format("Please enter a value between {0} and {1}."),
        max: jQuery.validator.format("O valor deve ser menor ou igual a {0}."),
        min: jQuery.validator.format("Please enter a value greater than or equal to {0}.")
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

  $(document).on('cocoon:after-insert', function(e, insertedItem) {
    $(".cpf").mask("999.999.999-99");
    $(".rg").mask("99.999.999-9");
    $(".fone").mask("(99)9999-9999");
    $(".cnpj").mask("99.999.999/9999-99");
    $(".inscricao_estadual").mask("99999999-99");
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

  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });

});

$(document).ready(ready);
$(document).on('page:load', ready);
