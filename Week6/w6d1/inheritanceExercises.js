// // inherits with Surrogate
// Function.prototype.inherits = function (parent) {
//   function Surrogate() {}
//     Surrogate.prototype = parent.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// };

//Object.create
Function.prototype.inherits = function (parent) {
    this.prototype = Object.create(parent.prototype);
    this.prototype.constructor = this;
};

const MovingObject = function MovingObject() {};
MovingObject.prototype.move = function move () {
  console.log("moving object is moving");
};

const Ship = function Ship() {};
Ship.inherits(MovingObject);
Ship.prototype.fly =   function fly () {
    console.log("ship is flying");
  };

const Asteroid = function Asteroid() {};
Asteroid.inherits(MovingObject);
Asteroid.prototype.fly =   function fly () {
    console.log("asteroid is flying");
  };

let mo = new MovingObject();
let s = new Ship();
let a = new Asteroid();

mo.move();
s.fly();
s.move();
a.fly();
a.move();
