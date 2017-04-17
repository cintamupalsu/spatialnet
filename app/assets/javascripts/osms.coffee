# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$(document).on "upload:start", "form", (e) ->
		$(this).find("input[type=submit]").attr "disabled", true
		$("#progress-bar").slideDown('fast')
		
	$(document).on "upload:progress", "form", (e) ->
		detail          = e.originalEvent.detail
		percentComplete = Math.round(detail.loaded / detail.total = 100)
		$('.progress-bar').width("#{percentComplete}%");
		$('#progress-bar-text').text("#{percentComplete}% Complete")
		
	$(document).on "upload:success", "form", (e) ->
		$(this).find("input[type=submit]").removeAttr "disabled" unless $(this).find("input.uploading").length
		$("#progress-bar").slideUp('fast')