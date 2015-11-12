var assert = require('assert');

var primes = {};
var nonPrimes = {};

function primeFactorize(n) {
  var primeFactors = {};

  for (var i = 2; i <= n / 2; i++) {
    if (n % i === 0) {
      if (isPrime(i)) {
        primeFactors[i] = true;
      }
    }
  }

  return primeFactors;
}

function isPrime(n) {
  if (primes[n]) {
    return true;
  }
  if (nonPrimes[n]) {
    return false;
  }

  for (var i = 2; i <= Math.sqrt(n); i++) {
    if (n % i === 0) {
      nonPrimes[n] = true;
      return false;
    }
  }
if (n === 25) {
  console.log('lel');
}
  primes[n] = true;
  return true;
}

console.log(primeFactorize(170000001));
