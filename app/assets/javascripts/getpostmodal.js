function flashSuccessMessage(message){
  $(".alert .alert-content").html(message);
  $(".alert").addClass('alert-success');
  $(".alert").removeClass('hidden');
}

function flashErrorMessage(message) {
  $(".alert .alert-content").html(message);
  $(".alert").addClass('alert-error');
  $(".alert").removeClass('hidden');
}

function showModal(modalClass){
	$('body').addClass('locked');
	$('.' + modalClass).removeClass('yhide');
}

function hideModal(modalClass){
	//$('body').removeClass('locked');
	//$('.' + modalClass).addClass('yhide');
}

function createNewPost(e){
  e.preventDefault();
  showModal('newpostmodal');
}

function onNewPostSuccessHandler(event, data, status, xhr) {
  hideModal('newpostmodal');
  var newPostLink = "<a href='" + xhr.responseJSON.url + "'>View it here</a>.";
  flashSuccessMessage('<strong>Woot!</strong> Successfully created Experience! ' + newPostLink);
}

function onNewPostErrorHandler(event, data, status, xhr) {
  hideModal('newpostmodal');
  flashErrorMessage('<strong>Error!</strong> Could not create Experience!');
}

$(document).on("ajax:success", "#new-post-form", onNewPostSuccessHandler);

$(document).on("ajax:ajaxError", "#new-post-form", onNewPostErrorHandler);


$(document).on("click", ".close", function(e){
  e.preventDefault();
  var $dismissedElem = $("." + $(this).attr('data-dismiss'));
  $dismissedElem.fadeTo("slow", 0, function() {
    $dismissedElem.addClass('hidden');
    $dismissedElem.css('opacity','1');
  });
});

$(document).on("click", "#next-button", function(e){
    $('#step-1').fadeOut(200, function(){
        $('#step-2').fadeIn(200);
    });
    $('#mod').scrollTop(0);
});
