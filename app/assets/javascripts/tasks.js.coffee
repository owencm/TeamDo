# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

list = []
$ ->

    $('.dropdown-toggle').dropdown()

    for box in $(".user-check")
        if $(box).is(":checked")
            list.push $(box).attr("user")
    $("#task-doers").attr("value", list)

    $('.user-check').change ->
        if $(this).is(":checked")
            list.push $(this).attr("user")
        else
            list.pop $(this).attr("user")
        $("#task-doers").attr("value", list)