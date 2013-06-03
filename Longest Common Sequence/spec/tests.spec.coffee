lcs = require '../longestCommonSequence'

describe "Get the sequence", ->
  it "should return a good result", ->
    expect(lcs([17,12,23,22,7,134,15,24], [2,5,6,12,7,13,14,134,15])).toEqual [12,7,134,15]
    expect(lcs([1,1,1], [2,5,6,12,1,7,13,14,134,15])).toEqual [1]
    expect(lcs([1,1,1], [2,1,2,1,1])).toEqual [1,1,1]
    expect(lcs([], [2,1,2,1,1])).toEqual []
    expect(lcs([3,2,1], [1,2,3])).toEqual [3]
    expect(lcs [1, 5, 2, 3, 4], [1, 2, 3, 4, 5]).toEqual [1, 2, 3, 4]
