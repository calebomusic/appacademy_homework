function MadLib(verb, adjective, noun) {
  return 'We shall ' + verb.toUpperCase() + ' the '
  + adjective.toUpperCase() + ' ' + noun.toUpperCase() + '.';
}

console.log(MadLib('make', 'best', 'guac'));

function isSubstring(searchString, subString) {
  for(let i = 0; i < searchString.length; i++) {
    for(let j = i + 1; j < searchString.length; j++) {
      if(searchString.slice(i, j) == subString) {
        return true;
      }
    }
  }
  return false;
}

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(array) {
  var arr = [];
  for(let i = 0; i < array.length; i ++) {
    if(array[i] % 3 === 0 && array[i] % 5 !== 0) {
      arr.push(array[i]);
    } else if(array[i] % 3 !== 0 && array[i] % 5 === 0) {
      arr.push(array[i]);
    }
  }
  return arr;
}

console.log(fizzBuzz([1,2,3,4,5, 15]))

function isPrime(num) {
  for(let i = num - 1; i > 1; i--) {
    if(num % i === 0) {
      return false;
    }
  }
  return true;
}

console.log(isPrime(2));
console.log(isPrime(3));
console.log(isPrime(6));

function sumOfNPrimes(num) {
  arr = []

  for(let i = 2; arr.length < num; i ++) {
    if(isPrime(i)) {
      arr.push(i);
    }
  }

  return arr.reduce( function(sum, n) {
    return sum + n;
  })
}

console.log(sumOfNPrimes(3));

function allOrNothing(mod, ...args) {
  for(let i = 0; i < args.length; i ++) {
    if(args[i] % mod !== 0) { return false; }
  }

  return true;
}

console.log(allOrNothing(3, 9, 12, 6));

console.log(allOrNothing(5, 1, 2, 10));
