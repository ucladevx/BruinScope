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

function getQuestionsView(){
    $('.experience-view').fadeOut(200, function(){
            $('.questions-view').fadeIn(200);
    });
    $('#experience-nav').removeClass('modal-active');
    $('#experience-nav').addClass('modal-inactive');

    $('#questions-nav').addClass('modal-active');
    $('#questions-nav').removeClass('modal-inactive');
}
function getExperienceView(){
    $('.questions-view').fadeOut(200, function(){
            $('.experience-view').fadeIn(200);
    });
    $('#questions-nav').removeClass('modal-active');
    $('#questions-nav').addClass('modal-inactive');

    $('#experience-nav').addClass('modal-active');
    $('#experience-nav').removeClass('modal-inactive');
}

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

function submitFilterForm(url) {
  var data = {"roles":[]};
  $(".tag-button-clicked").each(function(){
    var role = $(this).attr('data-filter-role');
    data["roles"].push(role);
  })
  $orderBy = $(".order-by-element-clicked");
  if ($orderBy.length > 0) {
    data["order_by"] = $orderBy.first().attr("data-order-by");
    $("#ordered-by").html($orderBy.children('a').html());
  }
  console.log(data);
  $.ajax({
    url: url,
    data: data,
    type: "POST",
    success: function(data) {
      console.log("success");
      // console.log(data);
      // $("#posts")[0].innerHTML = data;
      // $("#posts").html(data[])
    },
    complete: function(data, status) {
      console.log(status);
      $("#posts").html(data.responseText);
    }
  });
}

$(document).on("click", "#filter-home-page", function(e) {
    console.log("he");
    $('#filter-home-page-card').fadeToggle(200, 'swing');
});


$(document).on("click", ".tag-button", function(e){
  e.preventDefault();
  $(this).toggleClass("tag-button-clicked");
});

$(document).on("click", ".order-by-element", function(e){
  $(".order-by-element-clicked").each(function(){
    $(this).removeClass("order-by-element-clicked");
  })
  $(this).toggleClass("order-by-element-clicked");
});

$(document).on("click", ".order-by-element a", function(e){
  e.preventDefault();
});

$(document).on("click", "#filter-cancel", function(e){
  $(".order-by-element-clicked").each(function(){
    $(this).removeClass("order-by-element-clicked");
  })
  $(".tag-button-clicked").each(function(){
    $(this).removeClass("tag-button-clicked");
  })
});

$(document).on("click", "#filter-apply", function(e){
  var url = $(this).attr('data-url');
  $('#filter-home-page-card').fadeToggle(200, 'swing');
  submitFilterForm(url);
});
