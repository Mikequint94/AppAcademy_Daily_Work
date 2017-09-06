const Board = require('./snake.js');

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
