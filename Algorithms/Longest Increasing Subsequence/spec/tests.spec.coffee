lis = require '../'

describe "longest increase subsequence", ->
  it "should return 0 on empty array", ->
    expect(lis []).toBe 0
  it "should return the good result", ->
    expect(lis [0, 0]).toBe 2
    expect(lis [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]).toBe 6
    expect(lis [5, 4, 3, 2, 1]).toBe 1
