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
