# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#$("#user").click ->
#  window.location.href "/users/search?inp=" + $("#search_input").val()

$(document).ready ->
  $("#post").click ->
    $("#search_form").attr "action", "/posts/search"