function range(start, end) {
  let array = [];
  if (start === end) {
    return [end];
  }
  else {
    array.push(start);
    return array.concat(range(start + 1, end));
  }
  // for (let i = start; i < end + 1; i++) {
  //   array.push(i);
  // }

}

// console.log(range(2, 6));

function sumRec(arr) {
  let sum = 0;

  if (arr.length === 1) {
    return arr[0];
  }
  // if (arr.length === 2) {
  //   return arr[0] + arr[1];
  // }

  return arr[0] + sumRec(arr.slice(1));
}

// console.log(sumRec([2,8,12]));

function exponent1(base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent1(base,(exp-1));
}

// console.log(exponent1(3,4));

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  }
  if (exp === 1) {
    return base;
  }
  if (exp % 2 === 0) {
    return Math.pow(exponent2(base, exp/2 ), 2);
  }
  else {
    return base * Math.pow(exponent2(base, (exp - 1)/2 ), 2);
  }
}

// console.log(exponent2(4,3));

function fibonacci(n) {
  if (n <= 1) {
    return n;
  }

  let fib = fibonacci(n - 2) + fibonacci(n - 1);
  return fib;
}

// console.log(fibonacci(6));

function bsearch(arr, target) {
  let mid = Math.floor(arr.length/2);
  if (arr.length === 0) {
    return -1;
  }
  if (arr[mid] === target) {
    return mid;
  }

  let left = arr.slice(0, mid);
  let right = arr.slice(mid + 1);

  if (arr[mid] < target) {
    const subProblem = bsearch(right, target);
    return subProblem === -1 ? -1: subProblem + mid + 1;
  } else {
    return bsearch(left, target);
  }
}

// console.log(bsearch([1,2,3,4,5,6,7], 8));

function mergesort(arr) {
  if (arr.length <= 1) {
    return arr;
  }
  let mid = Math.floor(arr.length/2);
  let left = mergesort(arr.slice(0,mid));
  let right = mergesort(arr.slice(mid));

  return merge(left, right);
}

function merge(left, right) {
  let sorted = [];
  while ((left.length > 0) && (right.length > 0)) {
    if (left[0] <= right[0]) {
      sorted.push(left.shift());
    } else {
      sorted.push(right.shift());
    }
  }
  return sorted.concat(left,right);
}

// console.log(mergesort([4,2,6,1,7]));

function subsets(arr) {
  if (arr.length === 0) {
    return [[]];
  }
  let withoutFirst = subsets(arr.slice(1));
  let first = arr[0];
  let withFirst = withoutFirst.map(sub => [first].concat(sub));
  return withoutFirst.concat(withFirst);
}

console.log(subsets([1,2,3]));

console.log(`subsets([1, 3, 5]) = ${JSON.stringify(subsets([1, 3, 5]))}`);
