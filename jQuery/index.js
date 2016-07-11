console.log("hello");

var cell = $('.cell');
// debugger
setTimeout(function() {
  var cell = $('.cell');
  cell.removeClass('blue');
  cell.addClass('red');
  // cell.toggleClass('red');
}, 2000);
console.log("bye");
