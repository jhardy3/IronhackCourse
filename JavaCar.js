// var Car = function(model, noise) {
//   this.model = model
//   this.noise = noise
//   this.numberOfWheels = 4
// }
//
// Car.prototype.printNoise = function () {
//   console.log(this.noise);
// };
//
//
// var car = new Car("Ford", "Vrrrrrooooommm")
// car.printNoise()
function blastUp(num,time) {
  if (num != time) {
    console.log(num++);
    setTimeout(function() {
      blastUp(num++, time)
    }, 1000)
  } else {
    console.log("BLAST UPPP!!!");
  }
}


// sleep(1, 2, function() {
//   console.log("");
// });




// blastUp(1,10)


function sleep(time, callback) {
  setTimeout(callback,time * 1000)
}


function blastOff(time) {
  console.log(time);
  if (time > 0) {
    setTimeout(function() {
      blastOff(time - 1);
    }, 1000)
  } else {
    console.log("BLAST OFF!!!!");
  }
}



blastOff(10)
