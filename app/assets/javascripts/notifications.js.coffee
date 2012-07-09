$ -> 
	if $("#hidden-notice").length
		$("#notify-container").notify()
		# setTimeout($ -> ($("#notify-container").notify("create", {text: $("#hidden-notice").text() })), 1000) 
		secTimeout = (callback) -> setTimeout(callback, 1000)
		doNotify = (container) -> $(container).notify("create", {text: $("#hidden-notice").text() })
		secTimeout ->
			$ -> doNotify "#notify-container"