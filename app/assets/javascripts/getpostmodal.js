function showModal(modalClass){
	$('body').addClass('locked');
	$('.' + modalClass).removeClass('yhide');
}

function hideModal(modalClass){
	$('body').removeClass('locked');
	$('.' + modalClass).addClass('yhide');
}

function createNewPost(e){
  console.log('aayyy');
  e.preventDefault();
  showModal('newpostmodal');
}
