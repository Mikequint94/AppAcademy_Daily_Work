const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

const Asteroid = function Asteroid(options) {
  Asteroid.COLOR = "pink";
  Asteroid.RADIUS = 10;
  options.color = Asteroid.COLOR;
  options.radius = Asteroid.RADIUS;
  options.vel = Util.randomVec(5);

  MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
