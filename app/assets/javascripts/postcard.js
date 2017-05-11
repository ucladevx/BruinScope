function onVoteHandler(event, data, status, xhr) {
	var button = $(event.currentTarget);
	button.find(".upvote-value")[0].innerHTML = "&nbsp+ " + data.upvote;
	button.toggleClass("upvote-btn-clicked");
	button.find('#upvote-btn-line').toggleClass("upvote-btn-line-clicked");
}

$(document).on("ajax:success", "#upvote", onVoteHandler);
