const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor () {
    this.stacks = [[3,2,1],[],[]];
  }


  validMove(from, to) {
    let bool1 = this.stacks[from].length > 0;
    let bool2 = this.stacks[from].slice(-1) < this.stacks[to].slice(-1);
    let bool3 = this.stacks[to].length === 0;
    let bool4 = from !== to;

    return bool1 && (bool2 || bool3) && bool4;
  }

  updateTowers (from, to) {
    this.stack[to].concat(this.stacks[from].pop());
  }

  displayTowers () {
    console.log(this.stacks);
  }

  isWon() {
    let bool1 = this.stacks[0].length === 0;
    let bool2 = this.stacks[1].length === 3;
    let bool3 = this.stacks[2].length === 3;

    return bool1 && (bool2 || bool3);
  }
  promptMove() {
    let from = 0;
    let to = 0;
    this.displayTowers();
    reader.question("Move from?", function(responseFrom){
      from = parseInt(responseFrom);
      reader.question("Move to?", function(responseTo){
        to = parseInt(responseTo);
        if (this.validMove(from, to)){
          this.updateTowers(from, to);
        } else {
          console.log("Invalid move, try again");
          this.promptMove();
        }
      });
    });

  }

  run () {
    // until game over
      // set up the board and render
      // ask player for input
      // execute move if valid
      // render
  }
}

const toh = new Game;
toh.promptMove();
