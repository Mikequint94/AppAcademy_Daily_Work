/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const GameView = __webpack_require__(1);

document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d");

  let gv = new GameView(ctx);
  gv.start();
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(2);

const GameView = function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx;
};

GameView.prototype.start = function start() {
  let myThis = this;
  setInterval(function () {
    myThis.game.draw(myThis.ctx);
    myThis.game.step();
  }, 20);
};

module.exports = GameView;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(3);

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(4);
const MovingObject = __webpack_require__(5);

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


/***/ }),
/* 4 */
/***/ (function(module, exports) {

const Util = {
  inherits (childClass, parentClass) {
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  },
  randomVec (length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale (vec, m) {
    return [vec[0] * m, vec[1] * m];
  },
  distanceBetween(pos1, pos2) {
    return Math.sqrt(Math.pow((pos1[0] - pos2[0]),2) +
            Math.pow((pos1[1] - pos2[1]),2));
  }
};

module.exports = Util;


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(4);

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


/***/ })
/******/ ]);