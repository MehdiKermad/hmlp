# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # on vérifie que l'on est dans la bonne page
  if $("#homeMainDiv").length>0
    x = $("#test");

    getLocation = ->
      if navigator.geolocation
        navigator.geolocation.getCurrentPosition(showPosition, showError);
      else
        x.html("Geolocation is not supported by this browser.");

    showPosition = (position) ->
      x.html("Latitude: " + position.coords.latitude + "<br>Longitude: " + position.coords.longitude)

    showError = (error) ->
      switch error.code
        when error.PERMISSION_DENIED
          x.html("User denied the request for Geolocation.")
        when error.POSITION_UNAVAILABLE
          x.html("Location information is unavailable.")
        when error.TIMEOUT
          x.html("The request to get user location timed out.")
        when error.UNKNOWN_ERROR
          x.html("An unknown error occurred.")
        
    getLocation()