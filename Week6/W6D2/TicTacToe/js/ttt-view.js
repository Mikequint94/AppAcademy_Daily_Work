class View {
  constructor(game, $el) {
    this.$el = $el;
    this.game = game;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (e) => {
      const $square = $(e.currentTarget);
      let pos = $square.attr("data-pos").split(",").map((str) => parseInt(str));
      this.game.playMove(pos);
      this.makeMove($square);
    });
  }

  makeMove($square) {


    $square.css('background-color', 'white');
    $square.text(`${this.game.currentPlayer}`);
    $square.addClass(`${this.game.currentPlayer}`);
    $square.on("mouseleave", (e) => {
        const $square = $(e.currentTarget);
        $square.css('background-color', 'white');
      }
    );
    if(this.game.board.isOver()) {
      let $winText = $("<h1>");
      $winText.text(`${this.game.currentPlayer.toUpperCase()} Wins!`);
       this.$el.append($winText);
    }
  }

  setupBoard() {
    for(let i = 0; i < 3; i++) {
      let $row = $("<ul>");
      for(let j = 0; j < 3; j ++) {
        let $square = $("<li>").attr("data-pos", [i, j]);
        //let squareColor = 'grey';
        $square.on("mouseenter", (e) => {
          const $square = $(e.currentTarget);
          $square.css('background-color', 'yellow');
        });
        $square.on("mouseleave", (e) => {
            const $square = $(e.currentTarget);
            $square.css('background-color', 'grey');
          }
        );
        // $square.on("click", (e) => {
        //   const $square = $(e.currentTarget);
        //   this.game.playMove($square);
        // });
        $row.append($square);
      }
      this.$el.append($row);
    }
  }

}

module.exports = View;
