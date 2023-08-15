"use strict";
function mysteryScoping1() {
  var x = "out of block";
  // eslint-disable-next-line no-constant-condition
  if (true) {
    var x = "in block";
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = "out of block";
  if (true) {
    const x = "in block";
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = "out of block";
  if (true) {
    const x = "in block";
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = "out of block";
  if (true) {
    let x = "in block";
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  if (true) {
    let x = "in block";
    console.log(x);
  }
  let y = "out of block again";
  console.log(y);
}

const madLib = (verb, adj, noun) => {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`;
};

const isSubString = (searchString, subString) => {
  return searchString.includes(subString);
};

const fizzBuzz = (array) => {
  const fizzBuzzArr = [];

  array.forEach((el) => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzBuzzArr.push(el);
    }
  });

  return fizzBuzzArr;
};

const isPrime = (n) => {
  if (n < 2) {
    return false;
  }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) return false;
  }

  return true;
};

const sumOfNPrimes = (n) => {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++;
  }

  return sum;
};

console.log(sumOfNPrimes(4));
