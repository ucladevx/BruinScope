function initCarousel(className, slides){

  $(className).slick({
	  dots: false,
	  infinite: false,
	  draggable: true,
	  speed: 1000,
	  slidesToShow: 5,
	  slidesToScroll: slides,
	  arrows: true,
	  prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>',
	  nextArrow: '<button type="button" class="slick-next"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>',
	  responsive: [
	    {
	      breakpoint: 1024,
	      settings: {
	        slidesToShow: 10,
	        slidesToScroll: 10,
	        infinite: true,
	        dots: true
	      }
	    },
	    {
	      breakpoint: 600,
	      settings: {
	        slidesToShow: 10,
	        slidesToScroll: 10
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
	        slidesToShow: 10,
	        slidesToScroll: 10
	      }
	    }
	  ]
	});
}
