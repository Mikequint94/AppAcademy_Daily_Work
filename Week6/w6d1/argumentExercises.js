// Using arguments
function sum() {
  let args = Array.from(arguments);
  let s = 0;
  args.forEach(function (arg) {
    s += arg;
  });
  return s;
}

console.log("Sum");
console.log(sum(1,2,3,4));
console.log(sum(1,2,3,4,5));

// Using rest operator
function sum2 (...args) {
  let s = 0;
  args.forEach(function (arg) {
    s += arg;
  });

  return s;
}

console.log("Sum 2");
console.log(sum2(1,2,3,4));
console.log(sum2(1,2,3,4,5));

// myBind with arguements
// Function.prototype.myBind = function myBind (ctx) {
//   let func = this;
//   let args = Array.from(arguments).slice(1);
//   return function() {
//     let args2 = Array.from(arguments);
//     let allArgs = args.concat(args2);
//     func.apply(ctx, allArgs);
//   };
// };

// myBind with rest operator
Function.prototype.myBind = function myBind(ctx, ...args) {
  return (...args2) => {
    let allArgs = args.concat(args2);
    this.apply(ctx, allArgs);
  };
};


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

markov.says("meow", "Ned");
markov.says.myBind(breakfast, "meow", "Kush")();
// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true

function curriedSum(numArgs) {
  let numbers = [];
  let s = 0;

  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      numbers.forEach (function (arg) {
        s += arg;
      });
      numbers = [];
      let returnS = s;
      s = 0;
      return returnS;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}
const csum = curriedSum(4);
// console.log(csum(5)(30)(20)(1)); // => 56
// console.log(csum(5)(30)(20)(1)); // => 56

//curry with apply
Function.prototype.curry = function curry(numArgs) {
  let arr = [];
  let func = this;
  function _curry(arg) {
    arr.push(arg);
    if (arr.length === numArgs) {
      return func.apply(func, arr);
    } else {
      return _curry;
    }
  }
  return _curry;
};


// const sumCurry = sum.curry(4);
// console.log(sumCurry(5)(30)(20)(1));

//curry with spread ...
Function.prototype.curry = function curry(numArgs) {
  let arr = [];
  let func = this;
  function _curry(arg) {
    arr.push(arg);
    if (arr.length === numArgs) {
      let arr2 = arr;
      arr = [];
      return func(...arr2);
    } else {
      return _curry;
    }
  }
  return _curry;
};

const sumCurrySpread = sum.curry(4);
console.log(sumCurrySpread(5)(30)(20)(12));
console.log(sumCurrySpread(5)(30)(20)(12));
