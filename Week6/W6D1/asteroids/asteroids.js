const GameView = require('./lib/game_view.js');

document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d");

  let gv = new GameView(ctx);
  gv.start();
});
