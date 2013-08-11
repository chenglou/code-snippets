# Output fibonnaci numbers and primes using custom generator and sieve of
Erasthosthenes.

(Ok that wasn't easy).

Format: `[number, suspendedStream]` where suspendedStream is really just a
function that, upon calling, returns another `[number, suspendedStream]`.

    head = (a) -> a[0]

    tail = (a) -> do a[1] if a[1]

    take = (n, a) ->
      if n <= 0 then []
      else [head a].concat(take n - 1, tail a)

    fib = (a, b) -> [a, -> fib(b, a + b)]

    ones = -> [1, -> ones()]

    nat = (a) -> [a, -> nat a + 1]

    _filter = (a, fn) ->
      if fn head a then [head(a), -> _filter tail(a), fn]
      else _filter tail(a), fn

    sieve = (a) ->
      x = head a
      discarder = (item) -> item % x isnt 0
      return [x, -> sieve(_filter tail(a), discarder)]

    module.exports =
      head: head
      tail: tail
      take: take
      fib: fib
      ones: ones
      nat: nat
      sieve: sieve


