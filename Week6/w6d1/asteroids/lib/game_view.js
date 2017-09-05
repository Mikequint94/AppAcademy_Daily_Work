const Game = require('./game.js');

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
