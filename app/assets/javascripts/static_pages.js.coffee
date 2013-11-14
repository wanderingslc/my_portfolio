# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$("myTab a").click (e) -> 
  e.preventDefault()
  $(@).tab('show') 


$(document).ready ->
  $("#baconButton").click ->
    $.getJSON "https://baconipsum.com/api/?callback=?",
      type: "meat-and-filler"
      "start-with-lorem": "1"
      paras: "3"
    , (baconGoodness) ->
      if baconGoodness and baconGoodness.length > 0
        $("#baconIpsumOutput").html ""
        i = 0

        while i < baconGoodness.length
          $("#baconIpsumOutput").append "<p>" + baconGoodness[i] + "</p>"
          i++
        $("#baconIpsumOutput").show()

  $(document).ready ->
  $("#hipsterButton").click ->
    $.getJSON "http://hipsterjesus.com/api/", (data) ->
      $("#hipsterIpsumOutput").html data.text
  
  
