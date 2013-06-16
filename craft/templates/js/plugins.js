// Avoid `console` errors in browsers that lack a console.
(function() {
	var method;
	var noop = function () {};
	var methods = [
		'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
		'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
		'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
		'timeStamp', 'trace', 'warn'
	];
	var length = methods.length;
	var console = (window.console = window.console || {});

	while (length--) {
		method = methods[length];

		// Only stub undefined methods.
		if (!console[method]) {
			console[method] = noop;
		}
	}
}());

// Place any jQuery/helper plugins in here.

/*!
 * jQuery Cycle Lite Plugin
 * http://malsup.com/jquery/cycle/lite/
 * Copyright (c) 2008-2012 M. Alsup
 * Version: 1.7 (20-FEB-2013)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 * Requires: jQuery v1.3.2 or later
 */
;(function($) {
"use strict";

var ver = 'Lite-1.7';
var msie = /MSIE/.test(navigator.userAgent);

$.fn.cycle = function(options) {
	return this.each(function() {
		options = options || {};

		if (this.cycleTimeout)
			clearTimeout(this.cycleTimeout);

		this.cycleTimeout = 0;
		this.cyclePause = 0;

		var $cont = $(this);
		var $slides = options.slideExpr ? $(options.slideExpr, this) : $cont.children();
		var els = $slides.get();
		if (els.length < 2) {
			if (window.console)
				console.log('terminating; too few slides: ' + els.length);
			return; // don't bother
		}

		// support metadata plugin (v1.0 and v2.0)
		var opts = $.extend({}, $.fn.cycle.defaults, options || {}, $.metadata ? $cont.metadata() : $.meta ? $cont.data() : {});
		var meta = $.isFunction($cont.data) ? $cont.data(opts.metaAttr) : null;
		if (meta)
			opts = $.extend(opts, meta);

		opts.before = opts.before ? [opts.before] : [];
		opts.after = opts.after ? [opts.after] : [];
		opts.after.unshift(function(){ opts.busy=0; });

		// allow shorthand overrides of width, height and timeout
		var cls = this.className;
		opts.width = parseInt((cls.match(/w:(\d+)/)||[])[1], 10) || opts.width;
		opts.height = parseInt((cls.match(/h:(\d+)/)||[])[1], 10) || opts.height;
		opts.timeout = parseInt((cls.match(/t:(\d+)/)||[])[1], 10) || opts.timeout;

		if ($cont.css('position') == 'static')
			$cont.css('position', 'relative');
		if (opts.width)
			$cont.width(opts.width);
		if (opts.height && opts.height != 'auto')
			$cont.height(opts.height);

		var first = 0;
		$slides.css({position: 'absolute', top:0}).each(function(i) {
			$(this).css('z-index', els.length-i);
		});

		$(els[first]).css('opacity',1).show(); // opacity bit needed to handle reinit case
		if (msie)
			els[first].style.removeAttribute('filter');

		if (opts.fit && opts.width)
			$slides.width(opts.width);
		if (opts.fit && opts.height && opts.height != 'auto')
			$slides.height(opts.height);
		if (opts.pause)
			$cont.hover(function(){this.cyclePause=1;}, function(){this.cyclePause=0;});

		var txFn = $.fn.cycle.transitions[opts.fx];
		if (txFn)
			txFn($cont, $slides, opts);

		$slides.each(function() {
			var $el = $(this);
			this.cycleH = (opts.fit && opts.height) ? opts.height : $el.height();
			this.cycleW = (opts.fit && opts.width) ? opts.width : $el.width();
		});

		if (opts.cssFirst)
			$($slides[first]).css(opts.cssFirst);

		if (opts.timeout) {
			// ensure that timeout and speed settings are sane
			if (opts.speed.constructor == String)
				opts.speed = {slow: 600, fast: 200}[opts.speed] || 400;
			if (!opts.sync)
				opts.speed = opts.speed / 2;
			while((opts.timeout - opts.speed) < 250)
				opts.timeout += opts.speed;
		}
		opts.speedIn = opts.speed;
		opts.speedOut = opts.speed;

		opts.slideCount = els.length;
		opts.currSlide = first;
		opts.nextSlide = 1;

		// fire artificial events
		var e0 = $slides[first];
		if (opts.before.length)
			opts.before[0].apply(e0, [e0, e0, opts, true]);
		if (opts.after.length > 1)
			opts.after[1].apply(e0, [e0, e0, opts, true]);

		if (opts.click && !opts.next)
			opts.next = opts.click;
		if (opts.next)
			$(opts.next).unbind('click.cycle').bind('click.cycle', function(){return advance(els,opts,opts.rev?-1:1);});
		if (opts.prev)
			$(opts.prev).unbind('click.cycle').bind('click.cycle', function(){return advance(els,opts,opts.rev?1:-1);});

		if (opts.timeout)
			this.cycleTimeout = setTimeout(function() {
				go(els,opts,0,!opts.rev);
			}, opts.timeout + (opts.delay||0));
	});
};

function go(els, opts, manual, fwd) {
	if (opts.busy)
		return;
	var p = els[0].parentNode, curr = els[opts.currSlide], next = els[opts.nextSlide];
	if (p.cycleTimeout === 0 && !manual)
		return;

	if (manual || !p.cyclePause) {
		if (opts.before.length)
			$.each(opts.before, function(i,o) { o.apply(next, [curr, next, opts, fwd]); });
		var after = function() {
			if (msie)
				this.style.removeAttribute('filter');
			$.each(opts.after, function(i,o) { o.apply(next, [curr, next, opts, fwd]); });
			queueNext(opts);
		};

		if (opts.nextSlide != opts.currSlide) {
			opts.busy = 1;
			$.fn.cycle.custom(curr, next, opts, after);
		}
		var roll = (opts.nextSlide + 1) == els.length;
		opts.nextSlide = roll ? 0 : opts.nextSlide+1;
		opts.currSlide = roll ? els.length-1 : opts.nextSlide-1;
	} else {
		queueNext(opts);
	}

	function queueNext(opts) {
		if (opts.timeout)
			p.cycleTimeout = setTimeout(function() { go(els,opts,0,!opts.rev); }, opts.timeout);
	}
}

// advance slide forward or back
function advance(els, opts, val) {
	var p = els[0].parentNode, timeout = p.cycleTimeout;
	if (timeout) {
		clearTimeout(timeout);
		p.cycleTimeout = 0;
	}
	opts.nextSlide = opts.currSlide + val;
	if (opts.nextSlide < 0) {
		opts.nextSlide = els.length - 1;
	}
	else if (opts.nextSlide >= els.length) {
		opts.nextSlide = 0;
	}
	go(els, opts, 1, val>=0);
	return false;
}

$.fn.cycle.custom = function(curr, next, opts, cb) {
	var $l = $(curr), $n = $(next);
	$n.css(opts.cssBefore);
	var fn = function() {$n.animate(opts.animIn, opts.speedIn, opts.easeIn, cb);};
	$l.animate(opts.animOut, opts.speedOut, opts.easeOut, function() {
		$l.css(opts.cssAfter);
		if (!opts.sync)
			fn();
	});
	if (opts.sync)
		fn();
};

$.fn.cycle.transitions = {
	fade: function($cont, $slides, opts) {
		$slides.not(':eq(0)').hide();
		opts.cssBefore = { opacity: 0, display: 'block' };
		opts.cssAfter  = { display: 'none' };
		opts.animOut = { opacity: 0 };
		opts.animIn = { opacity: 1 };
	},
	fadeout: function($cont, $slides, opts) {
		opts.before.push(function(curr,next,opts,fwd) {
			$(curr).css('zIndex',opts.slideCount + (fwd === true ? 1 : 0));
			$(next).css('zIndex',opts.slideCount + (fwd === true ? 0 : 1));
		});
		$slides.not(':eq(0)').hide();
		opts.cssBefore = { opacity: 1, display: 'block', zIndex: 1 };
		opts.cssAfter  = { display: 'none', zIndex: 0 };
		opts.animOut = { opacity: 0 };
		opts.animIn = { opacity: 1 };
	}
};

$.fn.cycle.ver = function() { return ver; };

// @see: http://malsup.com/jquery/cycle/lite/
$.fn.cycle.defaults = {
	animIn:        {},
	animOut:       {},
	fx:           'fade',
	after:         null,
	before:        null,
	cssBefore:     {},
	cssAfter:      {},
	delay:         0,
	fit:           0,
	height:       'auto',
	metaAttr:     'cycle',
	next:          null,
	pause:         false,
	prev:          null,
	speed:         1000,
	slideExpr:     null,
	sync:          true,
	timeout:       4000
};

})(jQuery);


/*global jQuery */
/*jshint multistr:true browser:true */
/*!
* FitVids 1.0
*
* Copyright 2011, Chris Coyier - http://css-tricks.com + Dave Rupert - http://daverupert.com
* Credit to Thierry Koblentz - http://www.alistapart.com/articles/creating-intrinsic-ratios-for-video/
* Released under the WTFPL license - http://sam.zoy.org/wtfpl/
*
* Date: Thu Sept 01 18:00:00 2011 -0500
*/

(function( $ ){

  "use strict";

  $.fn.fitVids = function( options ) {
    var settings = {
      customSelector: null
    };

    if(!document.getElementById('fit-vids-style')) {

      var div = document.createElement('div'),
          ref = document.getElementsByTagName('base')[0] || document.getElementsByTagName('script')[0];

      div.className = 'fit-vids-style';
      div.id = 'fit-vids-style';
      div.style.display = 'none';
      div.innerHTML = '&shy;<style>         \
        .fluid-width-video-wrapper {        \
           width: 100%;                     \
           position: relative;              \
           padding: 0;                      \
        }                                   \
                                            \
        .fluid-width-video-wrapper iframe,  \
        .fluid-width-video-wrapper object,  \
        .fluid-width-video-wrapper embed {  \
           position: absolute;              \
           top: 0;                          \
           left: 0;                         \
           width: 100%;                     \
           height: 100%;                    \
        }                                   \
      </style>';

      ref.parentNode.insertBefore(div,ref);

    }

    if ( options ) {
      $.extend( settings, options );
    }

    return this.each(function(){
      var selectors = [
        "iframe[src*='player.vimeo.com']",
        "iframe[src*='youtube.com']",
        "iframe[src*='youtube-nocookie.com']",
        "iframe[src*='kickstarter.com'][src*='video.html']",
        "object",
        "embed"
      ];

      if (settings.customSelector) {
        selectors.push(settings.customSelector);
      }

      var $allVideos = $(this).find(selectors.join(','));
      $allVideos = $allVideos.not("object object"); // SwfObj conflict patch

      $allVideos.each(function(){
        var $this = $(this);
        if (this.tagName.toLowerCase() === 'embed' && $this.parent('object').length || $this.parent('.fluid-width-video-wrapper').length) { return; }
        var height = ( this.tagName.toLowerCase() === 'object' || ($this.attr('height') && !isNaN(parseInt($this.attr('height'), 10))) ) ? parseInt($this.attr('height'), 10) : $this.height(),
            width = !isNaN(parseInt($this.attr('width'), 10)) ? parseInt($this.attr('width'), 10) : $this.width(),
            aspectRatio = height / width;
        if(!$this.attr('id')){
          var videoID = 'fitvid' + Math.floor(Math.random()*999999);
          $this.attr('id', videoID);
        }
        $this.wrap('<div class="fluid-width-video-wrapper"></div>').parent('.fluid-width-video-wrapper').css('padding-top', (aspectRatio * 100)+"%");
        $this.removeAttr('height').removeAttr('width');
      });
    });
  };
})( jQuery );