matrixMultiply = require '../'

describe "Matrix multiplication", ->
  it "should return empty matrix on invalid multiplication", ->
    a = [[1]]
    b = [[1, 2]]
    expect(matrixMultiply a, b).toEqual []
  it "should return empty matrix on empty multiplication", ->
    a = []
    b = []
    expect(matrixMultiply a, b).toEqual []
  it "should multiply correctly square matrices", ->
    a = [[1]]
    b = [[2]]
    expect(matrixMultiply a, b).toEqual [[2]]

    a = b = [
      [1,0]
      [0,1]
    ]
    expect(matrixMultiply a, b).toEqual [[1,0],[0,1]]

    a = [
      [1,2,3]
      [2,3,4]
      [3,4,5]
    ]
    b = [
      [1,2,3]
      [2,3,4]
      [3,4,5]
    ]
    expect(matrixMultiply a, b).toEqual [[14,20,26],[20,29,38],[26,38,50]]

    a = b = [
      [1,1,1]
      [1,1,1]
      [1,1,1]
    ]
    expect(matrixMultiply a, b).toEqual [[3,3,3],[3,3,3],[3,3,3]]

  it "should multiply correctly as long as the multiplication is valid", ->
    a = [[3, 4]]
    b = [[1], [2]]
    expect(matrixMultiply a, b).toEqual [[11]]




