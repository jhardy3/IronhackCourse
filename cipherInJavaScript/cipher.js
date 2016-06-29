console.log( "b".charCodeAt(0) );  //=>  98
console.log( "r".charCodeAt(0) );  //=> 114

console.log( String.fromCharCode(95)  );  //=> "_"
console.log( String.fromCharCode(111) );  //=> "o"


function shiftAround(char, shift) {
  var charNumber = char.toUpperCase().charCodeAt(0)
  var charCode = ((charNumber - 65 + shift) % 26) + 65
  return String.fromCharCode(charCode)
}

function encode(word, shift) {
  var encodedWord = ''

  word.split('').forEach(function(letter){
    if (letter >= 'A' && letter <= 'Z') {
      encodedWord += shiftAround(letter, shift)
    } else if (letter >= 'a' && letter <= 'z') {
      encodedWord += shiftAround(letter, shift).toLowerCase()
    } else {
      encodedWord += letter
    }
  })
  return encodedWord
}

console.log(encode("Et tu, brute?", 6));
