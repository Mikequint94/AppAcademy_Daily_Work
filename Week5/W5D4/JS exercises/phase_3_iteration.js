Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (sorted === false) {
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
        if (this[i] > this[i+1]) {
          sorted = false;
          let temp = this[i+1];
          this[i+1] = this[i];
          this[i] = temp;
        }
    }
  }
  return this;
};

// console.log([4, 6, 3, 1].bubbleSort());

String.prototype.substrings = function () {
  let array = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      array.push([this.slice(i, j)]);
    }
  }
  return array;
};
console.log("lolzhi".substrings());
