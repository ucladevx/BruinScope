# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on("click", ".comment-reply", (e) ->
    $(this).closest('.comment').find('.reply-form').toggle()
    return
    )
	#$("#comment-form")
	#	.on "ajax:beforeSend", (event, xhr, settings) ->
	#		$(this).find('textarea').attr('disabled', 'disabled');
	#	.on "ajax:success", (event, xhr, settings) ->
	#		$(this).find('textarea').removeAttr('disabled', 'disabled').val('');
	#		$(xhr.responseText).hide().insertAfter($(this)).show('slow')
