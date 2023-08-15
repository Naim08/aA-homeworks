"use strict";
function mysteryScoping1() {
  var x = "out of block";
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

const titleize = (names) => {
  const naim = "naim";
  return () => {
    console.log(naim);
    let titleized = names.map(
      (name) => `Mx. ${name} ${naim} Jingleheimer Schmidt`
    );
    console.log(titleized);
  };
};
let title = titleize(["Mary", "Brian", "Leo"]);
title();
const naim = "naim2";
title();

class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
  sayHello() {
    console.log(`Hello, my name is ${this.name}`);
  }
  visit(person) {
    console.log(`Hello ${person.name}, my name is ${this.name}`);
  }
}

class Naim extends Person {
  #age;
  constructor(name, age, favColor) {
    super(name, age);
    this.favColor = favColor;
    this.#age = age;
  }
  sayHello() {
    console.log(
      `Hello, my name is ${this.name} and my fav color is ${this.favColor}`
    );
  }
  #privateMethod() {
    console.log("hi, I am private");
  }
}

const hi = function () {
  console.log("hi");
};
const hi2 = () => {
  console.log("hi");
};
// arr.forEach((el, i) => {
//   console.log(el);
// });

// Global context

// const myFunc = function (num, callback) {
//   console.log("myFunc");
//   // this.name = "naim2";
//   callback.bind(this)(num);
// };

// myFunc(5, function (num) {
//   console.log(this.name);
//   console.log(num);
// });
