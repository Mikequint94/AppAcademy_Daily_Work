const Asteroid = require('./asteroid.js');

const Game = function Game () {
  Game.DIM_X = 500;
  Game.DIM_Y = 500;
  Game.NUM_ASTEROIDS = 10;
  this.asteroids = [];
  this.addAsteroids();
};

Game.prototype.addAsteroids = function () {
  let myThis = this;
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    myThis.asteroids.push(new Asteroid({pos: myThis.randomPosition(),
                                       game: myThis}));
  }
};

Game.prototype.randomPosition = function () {
  let pos = [];
  pos[0] = Game.DIM_X * Math.random();
  pos[1] = Game.DIM_Y * Math.random();
  return pos;
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0,0,Game.DIM_X,Game.DIM_Y);
  ctx.fillStyle = 'black';
  ctx.fillRect(0, 0, 500, 500);
    this.asteroids.forEach( function (asteroid) {
    asteroid.draw(ctx);
  });

};

Game.prototype.moveObjects = function () {
  this.asteroids.forEach( function (asteroid) {
    asteroid.move();
  });
};

Game.prototype.wrap = function (pos) {
  if (pos[0] < 0) {
    pos[0] += 500;
  } else if (pos[0] > 500) {
    pos[0] -= 500;
  }
  if (pos[1] < 0) {
    pos[1] += 500;
  } else if (pos[0] > 500) {
    pos[1] -= 500;
  }
};

Game.prototype.checkCollisions = function checkCollisions() {
  let myThis = this;
  this.asteroids.forEach(function (asteroid) {
    myThis.asteroids.forEach(function (otherAsteroid) {
      if (asteroid.isCollidedWith(otherAsteroid) &&
            asteroid !== otherAsteroid) {
        asteroid.collideWith(otherAsteroid);
      }
    });
  });
};

Game.prototype.step = function step() {
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function (asteroid) {
  let idx = this.asteroids.indexOf(asteroid);
  this.asteroids.splice(idx, 1);
};

module.exports = Game;
