$.fn.autocircle = function( options ) {
  var opts = $.extend( {}, $.fn.autocircle.defaults, options );
  this.css({
    height: this.width()
  })
};

// Plugin defaults – added as a property on our plugin function.
$.fn.autocircle.defaults = {
  foreground: "red",
  background: "yellow"
};
