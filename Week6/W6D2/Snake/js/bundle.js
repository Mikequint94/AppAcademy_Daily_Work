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

const View = __webpack_require__(1);

$( () => {
  let board =  $('.snake');
  new View(board);
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Board = __webpack_require__(2);

class View {
  constructor($el) {
    this.$el = $el;
    let board = new Board();
    this.setupBoard();

    this.step(board);
    this.newPos = [10,10];

    $(window).on("keydown", this.handleKeyEvent.bind(this));


  }
  handleKeyEvent(event) {
    if (View.KEYS[event.keyCode]) {
      this.board.snake.turn(View.KEYS[event.keyCode]);
    }
  }


  step(board) {
    let myThis = this;
    setInterval(function() {
      $(`[data-pos ~= '${myThis.newPos}']`).removeClass('snake');
      myThis.newPos = board.snake.move();
      $(`[data-pos ~= '${myThis.newPos}']`).addClass('snake');
    }, 500);

  }

  // $square.addClass('.snake');  `${this.newPos}


  setupBoard() {
    for (let i =0; i < 20; i++) {
      let $row = $("<ul>");
      for (let j = 0; j < 20; j++) {
        let $square = $("<li>").attr("data-pos", [i, j]);
        $row.append($square);
      }
      this.$el.append($row);
    }
  }

}
View.KEYS = {
  38: "N",
  39: "E",
  40: "S",
  37: "W"
};

module.exports = View;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

class Snake {
  constructor(pos) {
    this.DIRECTIONS = ["N","E","S","W"];
    this.direction = this.DIRECTIONS[0];
    this.segments = [];
    this.pos = pos;
  }

  move(pos, direction) {
    pos = this.pos;
    if (direction === "N") {
      pos[1] -= 1;
    } else if (direction === "E") {
      pos[0] +=1;
    } else if (direction === "S") {
      pos[1] +=1;
    } else {
      pos[1] -=1;
    }
    return pos;
  }
  turn(newDirection) {
    this.direction = newDirection;
  }
}

class Board {
  constructor() {
    this.snake = new Snake([10,10]);

  }
}

class Coord {
  constructor() {}

  plus(){}

  equals() {}

  isOpposite() {}
}

module.exports = Board;


/***/ })
/******/ ]);