// Yep
$(document).ready(function(){function e(e,t,n,r){var i=$(this).height();$(this).parent().css("height",i)}$(".slideshow").cycle({next:".next",prev:".prev",slideResize:!1,containerResize:!1,timeout:0,speed:400,after:e});$(".video").fitVids()});