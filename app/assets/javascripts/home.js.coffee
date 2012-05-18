# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
typewatch = (->
	timer = 0
	(callback, ms) ->
		clearTimeout timer
		timer = setTimeout(callback, ms)
	)()

$(document).ready ->
	$("#quick-post").click (e) ->
		e.preventDefault()
		text = $("#post_content").attr "value"
		$.ajax
			type: "POST"
			url: "/posts"
			data:
				post:
					content: text
  		success: (msg) ->
  			console.log "saved"
			typewatch (->
  				location.reload()
			), 500