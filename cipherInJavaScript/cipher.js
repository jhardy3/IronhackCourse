console.log( "b".charCodeAt(0) );  //=>  98
console.log( "r".charCodeAt(0) );  //=> 114

console.log( String.fromCharCode(95)  );  //=> "_"
console.log( String.fromCharCode(200) );  //=> "o"


// function shiftAround(char, shift) {
//   var charNumber = char.toUpperCase().charCodeAt(0)
//   var charCode = ((charNumber - 65 + shift) % 26) + 65
//   return String.fromCharCode(charCode)
// }

function encode(word, shift) {
  var encodedWord = ''

  word.split('').forEach(function(letter){
    var tempLetter = letter;
    var charNumber = tempLetter.toUpperCase().charCodeAt(0);
    var charMath = (charNumber - 65 + shift) % 26;

    if (charMath < 0) {
      var charCode = charMath + 65 + 26;
    } else {
      var charCode = charMath + 65;
    }

    if (letter >= 'A' && letter <= 'Z') {
      encodedWord += String.fromCharCode(charCode)
    } else if (letter >= 'a' && letter <= 'z') {
      encodedWord += String.fromCharCode(charCode).toLowerCase();
    } else {
  
      encodedWord += letter;
    }
  })
  return encodedWord;
}

console.log(encode(encode("Et tu, brute?", 200), -200));
