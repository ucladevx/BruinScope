function showModal(modalClass){
	$('body').addClass('locked');
	$('.' + modalClass).removeClass('yhide');
}

function hideModal(modalClass){
	$('body').removeClass('locked');
	$('.' + modalClass).addClass('yhide');
}
