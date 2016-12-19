# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    #$('#livro_colecao').parent().hide()
    #$('#livro_obra').parent().hide()
    #$('#livro_disciplina').parent().hide()
    categorias = $('#livro_categoria').html()
    disciplinas = $('#livro_disciplina').html()
    colecoes = $('#livro_colecao').html()
    obras = $('#livro_obra').html()
    
    $('#livro_categoria').change ->
        categoria = $('#livro_categoria :selected').text()
        optionsDisciplina = $(disciplinas).filter("optgroup[label='#{categoria}']").html()
        if optionsDisciplina
            $('#livro_disciplina').html(optionsDisciplina)
            $('#livro_disciplina').parent().show()
        else
            $('#livro_disciplina').empty()
            #$('#livro_disciplina').parent().hide()
    
    $('#livro_disciplina').change ->
        categoria = $('#livro_categoria :selected').text()
        disciplina = $('#livro_disciplina :selected').text()
        filtro = categoria.concat(disciplina);
        optionsColec = $(colecoes).filter("optgroup[label='#{filtro}']").html()
        if optionsColec
            $('#livro_colecao').html(optionsColec)
            $('#livro_colecao').parent().show()
        else
            $('#livro_colecao').empty()
            #$('#livro_colecao').parent().hide()

    $('#livro_colecao').change ->
        categoria = $('#livro_categoria :selected').text()
        disciplina = $('#livro_disciplina :selected').text()
        colecao = $('#livro_colecao :selected').text()
        filtro = categoria.concat(disciplina, colecao);
        optionsObras = $(obras).filter("optgroup[label='#{filtro}']").html()
        if optionsObras
            $('#livro_obra').html(optionsObras)
            $('#livro_obra').parent().show()
        else
            $('#livro_obra').empty()
            $('#livro_obra').parent().hide()


