{head, tail, take, fib, ones, nat, sieve} = require '../'

describe "Taking the first item", ->
  it "should return undefined if the list's empty", ->
    expect(head []).toBeUndefined()
  it "should return the first item", ->
    expect(head [1, undefined]).toBe 1
    expect(head [1, -> 2]).toBe 1

describe "Taking the tail", ->
  it "should return undefined if the list's empty", ->
    expect(tail []).toBeUndefined()
  it "should return the first item", ->
    expect(tail [1, undefined]).toBe undefined
    expect(tail [1, -> [2, 3]]).toEqual [2, 3]

describe "Natural stream", ->
  it "should return a stream starting at n", ->
    expect(nat(0)[0]).toBe 0
    expect(typeof nat(0)[1]).toBe 'function'

describe "Dumb stream of constant 1s", ->
  it "should return a stream of 1s", ->
    expect(ones(0)[0]).toBe 1
    expect(typeof ones(0)[1]).toBe 'function'

describe "Natural stream", ->
  it "should return a stream of natural numbers starting at n", ->
    expect(nat(0)[0]).toBe 0
    expect(typeof nat(0)[1]).toBe 'function'

describe "Fibonacci stream", ->
  it "should return a fibonacci stream if we kick it off correctly with 0 and 1
      as base values", ->
    expect(fib(0, 1)[0]).toBe 0
    expect(typeof fib(0, 1)[1]).toBe 'function'

describe "Produce a stream in the form of an array", ->
  it "should produce an empty array if we're not taking any", ->
    expect(take(0, nat(2))).toEqual []
    expect(take(0, fib(2))).toEqual []
    expect(take(0, ones())).toEqual []
  it "should return the stream", ->
    expect(take(10, nat(0))).toEqual [0,1,2,3,4,5,6,7,8,9]
    expect(take(10, fib(0, 1))).toEqual [0,1,1,2,3,5,8,13,21,34]
    expect(take(10, ones())).toEqual [1,1,1,1,1,1,1,1,1,1]

describe "Produce primes", ->
  it "should produce an empty array if we're not taking any", ->
    expect(take(0, sieve nat 2)).toEqual []
  it "should return a stream of primes starting at n", ->
    expect(take(10, sieve nat 2)).toEqual [2,3,5,7,11,13,
                                                      17,19,23,29]
    expect(take(10, sieve nat 9)).toEqual [9,10,11,12,13,
                                                      14,15,16,17,19]


