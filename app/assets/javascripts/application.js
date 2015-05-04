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
//= require jquery-ui.min
//= require jquery_ujs
//= require jquery.mask.min
//= require jquery-price.min
//= require jquery.validate.min
//= require jquery.turbolinks
//= require turbolinks
//= require cocoon
//= require_tree .
//= require bootstrap.min


var ready;
ready = (function() {

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

  $(document).on('cocoon:after-insert', function(e, insertedItem) {
    $(".cpf").mask("999.999.999-99")
    $(".rg").mask("99.999.999-9")
    $(".fone").mask("(99)9999-9999")
    $(".cnpj").mask("99.999.999/9999-99");
    $(".inscricao_estadual").mask("99999999-99");
  });

});

$(document).ready(ready);
$(document).on('page:load', ready);
