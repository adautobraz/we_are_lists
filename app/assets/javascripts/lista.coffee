# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    $('#livro_colecao').parent().hide()
    $('#livro_obra').parent().hide()
    colecoes = $('#livro_colecao').html()
    obras = $('#livro_obra').html()
    $('#livro_disciplina').change ->
        disciplina = $('#livro_disciplina :selected').text()
        optionsColec = $(colecoes).filter("optgroup[label='#{disciplina}']").html()
        if optionsColec
            $('#livro_colecao').html(optionsColec)
            $('#livro_colecao').parent().show()
        else
            $('#livro_colecao').empty()
            $('#livro_colecao').parent().hide()

    $('#livro_colecao').change ->
        colecao = $('#livro_colecao :selected').text()
        optionsObras = $(obras).filter("optgroup[label='#{colecao}']").html()
        if optionsObras
            $('#livro_obra').html(optionsObras)
            $('#livro_obra').parent().show()
        else
            $('#livro_obra').empty()
            $('#livro_obra').parent().hide()


                
        
    
                
        
    