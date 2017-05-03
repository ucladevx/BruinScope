function onVoteHandler(event, data, status, xhr) {
	$(event.currentTarget).find(".upvote-value")[0].innerHTML = "&nbsp+ " + data.upvote;
}

$(document).on("ajax:success", "#upvote", onVoteHandler);
