let minion = function(x) {
    console.log(x);
};


// [1, 4, 3].myEach(minion);


Array.prototype.myMap = function(callback) {
  let array = [];
  for (let i = 0; i < this.length; i++) {
    array.push(callback(this[i]));
  }
  return array;
};

// console.log([1, 4, 3].myMap(minion));

Array.prototype.myReduce = function(callback, initialValue) {
  let accumulator = 0;
  let array2 = this;
  if (!initialValue) {
    accumulator = this[0];
    array2 = array2.slice(1);
  }
  else {
    accumulator = initialValue;
  }
  array2.myEach(function(el) {
    accumulator = callback(accumulator, el);
  });
  return accumulator;
};

Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};
// let nemo = function(acc, el) {
//   return acc + el;
// };

console.log([1, 2, 3].myReduce(function(acc, el) {
  return acc + el;
}));
