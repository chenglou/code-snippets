fsg= require '../fibSieveGenerator'

describe "Taking the first item", ->
  it "should return undefined if the list's empty", ->
    expect(fsg.head []).toBeUndefined()
  it "should return the first item", ->
    expect(fsg.head [1, undefined]).toBe 1
    expect(fsg.head [1, -> 2]).toBe 1

describe "Taking the tail", ->
  it "should return undefined if the list's empty", ->
    expect(fsg.tail []).toBeUndefined()
  it "should return the first item", ->
    expect(fsg.tail [1, undefined]).toBe undefined
    expect(fsg.tail [1, -> [2, 3]]).toEqual [2, 3]

describe "Natural stream", ->
  it "should return a stream starting at n", ->
    expect(fsg.nat(0)[0]).toBe 0
    expect(typeof fsg.nat(0)[1]).toBe 'function'

describe "Dumb stream of constant 1s", ->
  it "should return a stream of 1s", ->
    expect(fsg.ones(0)[0]).toBe 1
    expect(typeof fsg.ones(0)[1]).toBe 'function'

describe "Natural stream", ->
  it "should return a stream of natural numbers starting at n", ->
    expect(fsg.nat(0)[0]).toBe 0
    expect(typeof fsg.nat(0)[1]).toBe 'function'

describe "Fibonacci stream", ->
  it "should return a fibonacci stream if we kick it off correctly with 0 and 1
      as base values", ->
    expect(fsg.fib(0, 1)[0]).toBe 0
    expect(typeof fsg.fib(0, 1)[1]).toBe 'function'

describe "Produce a stream in the form of an array", ->
  it "should produce an empty array if we're not taking any", ->
    expect(fsg.take(0, fsg.nat(2))).toEqual []
    expect(fsg.take(0, fsg.fib(2))).toEqual []
    expect(fsg.take(0, fsg.ones())).toEqual []
  it "should return the stream", ->
    expect(fsg.take(10, fsg.nat(0))).toEqual [0,1,2,3,4,5,6,7,8,9]
    expect(fsg.take(10, fsg.fib(0, 1))).toEqual [0,1,1,2,3,5,8,13,21,34]
    expect(fsg.take(10, fsg.ones())).toEqual [1,1,1,1,1,1,1,1,1,1]

describe "Produce primes", ->
  it "should produce an empty array if we're not taking any", ->
    expect(fsg.take(0, fsg.sieve fsg.nat 2)).toEqual []
  it "should return a stream of primes starting at n", ->
    expect(fsg.take(10, fsg.sieve fsg.nat 2)).toEqual [2,3,5,7,11,13,
                                                      17,19,23,29]
    expect(fsg.take(10, fsg.sieve fsg.nat 9)).toEqual [9,10,11,12,13,
                                                      14,15,16,17,19]


