
// function squareMaker() {
//   for (var i = 0; i < 11; i++) {
//     for (var z = 0; z < 11; z++) {
//       if (z % 2 == 0) {
//         $('body').append('<div class="cell blue"></div>');
//       } else {
//         $('body').append('<div class="cell red"></div>');
//       }
//     }
//     $('body').append('<br>');
//   }
// }

function squareMaker() {
  for (var i = 0; i < 11; i++) {
    for (var z = 0; z < 11; z++) {
      $('body').append('<div class="cell blue"></div>');
    }
    $('body').append('<br>');
  }
}

function snakeMaker() {
  var cells = $('.cell');
  cells.each( function( index, element) {
    if (index == 33) {
      $(this).toggleClass('blue snake');
    }
  })
}

// squareMaker();
// setInterval(function() {
//   var cells = $('.cell');
//   cells.each( function( index, element) {
//     // if (Math.random() > 0.5) {
//     //   $(this).toggleClass('red blue')
//     // } else if (Math.random() > 0.3) {
//     //   $(this).toggleClass('red green')
//     // } else {
//     //   $(this).toggleClass('blue purple')
//     // }
//     $(this).toggleClass('red blue')
//   })
// }, 500);

squareMaker();
snakeMaker();

setInterval(function() {
  var cells = $('.cell');
  var moved = false
  cells.each( function( index, element) {
    if ($(this).hasClass("snake") && !moved) {
      $(this).toggleClass('blue snake');

      moved = true;
    } else if (moved) {
      if (index % 11 == 0) {
        snakeMaker();
        moved = false;
      } else {
        $(this).toggleClass('blue snake');
        moved = false;
      }
    }
  })
}, 500);

$('.cell').on('click', function() {
  console.log("wtf");
  $(this).addClass("blue snake");
});

//
//
//
// $('.inputs').on('submit', function(e) {
//   e.preventDefault()
//   var value = $.trim($('.inputs #name:input').val());
//   if (value.length != 0) {
//     e.submit();
//   } else {
//     console.log('Nope!!!');
//   }
//
// })
