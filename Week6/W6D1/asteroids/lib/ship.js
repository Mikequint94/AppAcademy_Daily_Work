const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');


const Ship = function (options) {
  options.radius = 10;
  options.color ='lime';
  options.vel = [0,0];

  MovingObject.call(this, options);
};



Util.inherits(Ship, MovingObject);

module.exports = Ship;
