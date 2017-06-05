# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  if $("#resultsMainDiv").length>0
    handler = Gmaps.build('Google')
    handler.buildMap({ provider: {}, internal: {id: 'mapHolder'}}, ->
      markers = handler.addMarkers(eval($("#markersList").text()))
      handler.bounds.extendWith(markers)
      handler.fitMapToBounds()
    );