Array.prototype.uniq = function() {
  let array = [];
  for (let i = 0; i < this.length; i++) {
    if (!array.includes(this[i])) {
    array.push(this[i]);
    }
  }
  return array;
};

// console.log([2, 3, 5, 3].uniq());

Array.prototype.twoSum = function() {
  let array = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        array.push([this[i], this[j]]);
      }
    }
  }
  return array;
};

// console.log([1, 2, 4, -2, -1].twoSum());

Array.prototype.transpose = function() {
  let array = [];
  for (let i = 0; i < this.length; i++) {
    let subArray = [];
    for (let j = 0; j < this[i].length; j++) {
      subArray.push(this[j][i]);
    }
    array.push(subArray);
  }
  return array;
};

console.log([[1,2,3],[4,5,6],[7,8,9]].transpose());
