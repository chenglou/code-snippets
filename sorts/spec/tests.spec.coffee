{quickSort, bubbleSort} = require '../'

test = (func) ->
	it "should return empty array on empty array input", ->
		expect(func []).toEqual []
	it "should return the item if the array has only one", ->
		expect(func [0]).toEqual [0]
		expect(func [-3]).toEqual [-3]
	it "should return items, sorted", ->
		expect(func [-1,6]).toEqual [-1,6]
		expect(func [5,6,4,1,4,9]).toEqual [1, 4, 4, 5, 6, 9]
		expect(func [1,0,0,0]).toEqual [0,0,0,1]

describe "QuickSort", ->
  test quickSort

describe "Bubble sort", ->
  test bubbleSort
