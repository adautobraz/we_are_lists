# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    $('#list_serie').parent().hide()
    series = $('#list_serie').html()

    $('#list_segmento').change ->
        segmento = $('#list_segmento :selected').text()
        optionsSerie = $(series).filter("optgroup[label='#{segmento}']").html()
        if optionsSerie
            $('#list_serie').html(optionsSerie)
            $('#list_serie').parent().show()
        else
            $('#list_serie').empty()
            $('#list_serie').parent().hide()
    