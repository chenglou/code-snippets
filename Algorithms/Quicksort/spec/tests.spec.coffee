quicksort = require '../'

describe "Quicksort", ->
	it "should return empty array on empty array input", ->
		expect(quicksort []).toEqual []
	it "should return the item if the array has only one", ->
		expect(quicksort [0]).toEqual [0]
		expect(quicksort [-3]).toEqual [-3]
	it "should return items, sorted", ->
		expect(quicksort [-1,6]).toEqual [-1,6]
		expect(quicksort [5,6,4,1,4,9]).toEqual [1, 4, 4, 5, 6, 9]
		expect(quicksort [1,0,0,0]).toEqual [0,0,0,1]

