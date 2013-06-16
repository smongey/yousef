// Yep

$(document).ready(function(){

	$('.slideshow').cycle({
		next: '.next',
		prev: '.prev',
		slideResize: false,
        containerResize: false,
        timeout: 0,
        speed: 400,
        after: onAfter
	});

	function onAfter(curr, next, opts, fwd){
        //get the height of the current slide
        var $ht = $(this).height();
        //set the container's height to that of the current slide
        $(this).parent().css("height", $ht);
	}

	$(".video").fitVids();

});