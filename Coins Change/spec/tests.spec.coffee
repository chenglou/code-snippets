jasmine = require 'jasmine-node'
coinsChange = require '../coinsChange'

describe "Get coins changes", ->
  it "should return 0 changes of each for $0", ->
    expect(coinsChange(0, [1,2,3])).toEqual([0, 0, 0])

  it "should return 5 $1 coins even though the other two coins are of the same value", ->
    expect(coinsChange(5, [1,1,1])).toEqual([5, 0, 0])

  it "should reject a negative total amount", ->
    expect(-> coinsChange(-1, [4, 3, 2])).toThrow("Total amount should be positive.")
    expect(-> coinsChange(-1, [])).toThrow("Total amount should be positive.")
    expect(-> coinsChange(-1, [0])).toThrow("Total amount should be positive.")

  it "should return empty for an empty change array and any amount of change", ->
    expect(coinsChange(1, [])).toEqual([])
    expect(coinsChange(0, [])).toEqual([])

  it "should be normal cases", ->
    expect(coinsChange(4, [1, 2])).toEqual([2, 0])
    expect(coinsChange(7, [5, 4, 2])).toEqual([1, 0, 1])
    expect(coinsChange(9, [5, 3, 2])).toEqual([1, 0, 2])

  it "should get as close as possible (without overflowing) to the result when it's not possible to get the exact amount", ->
    expect(coinsChange(7, [5, 3])).toEqual([0, 2])

  it "should handle floating points", ->
    expect(coinsChange(4.5, [0.1, 2.2])).toEqual([2, 1])
    expect(coinsChange(4.5, [2.2, 2.1, 0.2])).toEqual([1, 1, 1])

  it "should be a normal case, but not optimal", ->
    expect(coinsChange(6, [4, 3, 2])).toEqual([1, 0, 1])

  it "should reject change of 0 or negative value", ->
    expect(-> coinsChange(1, [0])).toThrow("Invalid change coins found: 0")
    expect(-> coinsChange(1, [1, 0])).toThrow("Invalid change coins found: 0")
    expect(-> coinsChange(0, [0, 1, 0])).toThrow("Invalid change coins found: 0")

    expect(-> coinsChange(1, [-10])).toThrow("Invalid change coins found: -10")
    expect(-> coinsChange(1, [1, -1])).toThrow("Invalid change coins found: -1")
    expect(-> coinsChange(1, [-1, 1, 0])).toThrow("Invalid change coins found: -1")
