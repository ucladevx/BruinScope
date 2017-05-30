# Fire this script upon scrolling and realizing that there are more pages to load
$ ->
	if $('.pagination').length && $('.posts-list').length
		$(window).on 'scroll', ->
			# Grab the URI for the next page to load
			more_posts_url = $('.pagination .next_page').attr('href')
			if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
				$('.pagination').text("Loading more posts...")
				# Fire JS AJAX request to pages_controller home action
				$.getScript more_posts_url
			return
		return
