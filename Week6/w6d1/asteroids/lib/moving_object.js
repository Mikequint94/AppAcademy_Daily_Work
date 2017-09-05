const Util = require("./utils.js");

const MovingObject = function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
};

MovingObject.prototype.draw = function draw(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI, true);
  // ctx.strokeStyle = `${this.color}`;
  // ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = `${this.color}`;
  ctx.fill();
};

MovingObject.prototype.move = function move() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  this.game.wrap(this.pos);
};

MovingObject.prototype.isCollidedWith = function isCollidedWith(otherObject) {
  const distance = Util.distanceBetween(this.pos, otherObject.pos);
  return distance < (this.radius + otherObject.radius);
};

MovingObject.prototype.collideWith = function collideWith(otherObject) {
  this.game.remove(this);
  this.game.remove(otherObject);
};

module.exports = MovingObject;
