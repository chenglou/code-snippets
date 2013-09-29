minInCircularSortedArray = require '../'

describe "Find minimum in a circular array", ->
  it "should return the minimum", ->
    expect(minInCircularSortedArray [5, 6, 1, 2, 3, 4]).toBe 1
    expect(minInCircularSortedArray [1, 2, 3, 4]).toBe 1
    expect(minInCircularSortedArray [5, 6, 7, 1, 2, 3, 4]).toBe 1
    expect(minInCircularSortedArray [1, 2, 3, 4, 5, 6, 7]).toBe 1
    expect(minInCircularSortedArray [2, 3, 4, 5, 6, 7, 8, 1]).toBe 1
    expect(minInCircularSortedArray [3, 4, 5, 1, 2]).toBe 1

  it "should work on edge cases", ->
    expect(minInCircularSortedArray [1]).toBe 1
    expect(minInCircularSortedArray [1, 2]).toBe 1
    expect(minInCircularSortedArray [2, 1]).toBe 1

  it "should work on negative numbers", ->
    expect(minInCircularSortedArray [-5, -6, 7, -1, -2, 3, 4]).toBe -6
