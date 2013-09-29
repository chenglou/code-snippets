checkCircularSortedArray = require '../'

describe "Check if array is circularly sorted", ->
  it "should check for edge cases", ->
    expect(checkCircularSortedArray []).toBeFalsy()
    expect(checkCircularSortedArray [0]).toBeTruthy()
  it "should return good value for equality", ->
    expect(checkCircularSortedArray [1,1]).toBeTruthy()
    expect(checkCircularSortedArray [1,2]).toBeTruthy()
    expect(checkCircularSortedArray [2,1]).toBeTruthy()
    expect(checkCircularSortedArray [2,2,2,1,0]).toBeTruthy()
    expect(checkCircularSortedArray [2,2,2,3,4]).toBeTruthy()
  it "should accept ascending and descending order", ->
    expect(checkCircularSortedArray [1,2,3]).toBeTruthy()
    expect(checkCircularSortedArray [3,2,1]).toBeTruthy()
  it "should tolerate circularity", ->
    expect(checkCircularSortedArray [1,2,1]).toBeTruthy()
    expect(checkCircularSortedArray [1,3,5,0,1]).toBeTruthy()
    expect(checkCircularSortedArray [5,1,2,3]).toBeTruthy()
    expect(checkCircularSortedArray [1,2,3,0]).toBeTruthy()
    expect(checkCircularSortedArray [1,1,1,0,1]).toBeTruthy()
  it "should return false otherwise", ->
    expect(checkCircularSortedArray [1,2,1,2]).toBeFalsy()
    expect(checkCircularSortedArray [2,1,2,1]).toBeFalsy()
    expect(checkCircularSortedArray [1,2,4,3,2,1]).toBeFalsy()
    expect(checkCircularSortedArray [9,5,3,9,5]).toBeFalsy()
