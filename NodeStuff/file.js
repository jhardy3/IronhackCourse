
var array = [2, -2, 2, 4, -6]

// function zeroSums(array) {
//   var sum = 0
//   for i = 0; i < array.count; i++ {
//     sum += array[i]
//     if sum == 0 {
//       console.log(i)
//     }
//   }
// }

// zeroSums(array)

// function process(array) {
//   var returnArray = [];
//   array.forEach(function(number1, index1){
//     array.forEach(function(number2, index2){
//       if (number1 + number2 == 0) {
//         returnArray.push(index1.toString() + "," + index2.toString());
//       }
//     })
//   })
//   return returnArray
// }
//
// console.log(process(array));

function averageColon(string) {
  var splitArray = string.split(":");

  var mappedArray = splitArray.map(function(numberOne) {
    return parseInt(numberOne, 10);
  })

  var total = mappedArray.reduce(function(numberOne, numberTwo) {
    return numberOne += numberTwo;
  })

  return parseFloat(total) / parseFloat(splitArray.length)
}

console.log(averageColon('80:70:90:100'));



// var flightToBali = ["Wayan", "Putu", "Gede", "Ni Luh", "Nyoman"];
// var counterCheckIn = checkInPassenger("Gede", flightToBali);
// counterCheckIn();
// ​
// ​
// ​
// function checkInPassenger(name, customersArray) {
// 	var passengerChecked;
// 	for (var i = 0; i<customersArray.length; i++) {
// 		if (customersArray[i] == name) {
// 			passengerChecked = function() {
//         console.log ("Hi, " + name + "You’re passenger #" + (i+1));
//       };
//     }
//   }
// return passengerChecked;
// }



var words = [
    "dead",         // 1st -> d
    "bygone",       // 2nd -> y
    "landing",      // 3rd -> n
    "cheaply",      // 4th -> a
    "assumed",      // 5th -> m
    "incorrectly",  // 1st -> i
    "attention",    // 2nd -> t
    "agent"         // 3rd -> e
];

function decode(array) {
  var encoded = ""
  array.forEach(function(word, i) {
    encoded += word[i%5];
  })
  return encoded
}

"even"
"odd"
function superDecode(sentence, type) {
  var array = sentence.split(" ")

  if (type.includes("even")) {
    array = array.filter(function(word, index) {
      return index % 2 == 0;
    })
  } else if (type.includes("odd")) {
    array = array.filter(function(word, index) {
      return index % 2 != 0;
    })
  }

  if (type.includes("reverse")) {
    return decode(array.reverse())
  } else {
    return decode(array)
  }

}

var sentence, message;

sentence = "fill the proper tank for the cow"

console.log(superDecode(sentence, "even-reverse"));
console.log(decode(words));
