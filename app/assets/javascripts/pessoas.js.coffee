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

    $(document).on 'cocoon:after-insert', (e, insertedItem) ->
      $(".cpf").mask("999.999.999-99")
      $(".rg").mask("99.999.999-9")
      $(".fone").mask("(99)9999-9999")
      $(".cnpj").mask("99.999.999/9999-99")
      $(".inscricao_estadual").mask("99999999-99")

    $(".cpf").mask("999.999.999-99")
    $(".rg").mask("99.999.999-9")
    $(".fone").mask("(99)9999-9999")
    $(".cnpj").mask("99.999.999/9999-99")
    $(".inscricao_estadual").mask("99999999-99")
    $(".cep").mask("99999-999")
    $('.real').maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false})

    carregar_estados()
    carregar_cidades()


