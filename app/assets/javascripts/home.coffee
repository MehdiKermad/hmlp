# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # on vérifie que l'on est dans la bonne page
  if $("#homeMainDiv").length>0

    getLocation = ->
      if navigator.geolocation
        navigator.geolocation.getCurrentPosition(showPosition, showError);
      else
        console.log("Geolocation is not supported by this browser.");

    showPosition = (position) ->
      $("#latInput").val(position.coords.latitude)
      $("#lngInput").val(position.coords.longitude)
      console.log("position.coords.latitude");
      console.log("position.coords.longitude");

    showError = (error) ->
      switch error.code
        when error.PERMISSION_DENIED
          console.log("User denied the request for Geolocation.")
        when error.POSITION_UNAVAILABLE
          console.log("Location information is unavailable.")
        when error.TIMEOUT
          console.log("The request to get user location timed out.")
        when error.UNKNOWN_ERROR
          console.log("An unknown error occurred.")
        
    getLocation()