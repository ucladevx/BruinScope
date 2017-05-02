function showModal(modalClass){
	$('body').addClass('locked');
	$('.' + modalClass).removeClass('yhide');
}

function hideModal(modalClass){
	$('body').removeClass('locked');
	$('.' + modalClass).addClass('yhide');
}

function createNewPost(e){
  e.preventDefault();
  showModal('newpostmodal');
}

$(document).ready(function(){
    $('a#upvote').click(function(){
        $(this).toggleClass("upvote-btn-clicked");
    });
});