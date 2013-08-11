median = require '../'

describe "Find median", ->
  it "should return nothing for empty array", ->
    expect(median []).toBeUndefined()
  it "should return the median on an array with one item", ->
    expect(median [1]).toBe 1
    expect(median [-1]).toBe -1
  it "should work on arrays with odd/even length and negative numbers", ->
    expect(median [5,7,3,5,7,8,2,1,3]).toBe 5
    expect(median [8,7,6,5,4,3,2,1]).toBe 4.5
  it "should work on arrays with duplicate items", ->
    expect(median [8,7,6,5,4,4,3,2,1]).toBe 4
    expect(median [-2,-2,-2,5,-3,-3,-3,-3]).toBe -2.5
    expect(median [2,2,2,2]).toBe 2
    expect(median [2,2,2]).toBe 2

