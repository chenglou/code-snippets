knapsack = require '../knapsack'

describe "Get the max number of items", ->
	it "should work on edge cases", ->
		expect(knapsack [], [], 10).toBe 0
		expect(knapsack [1], [2], 0).toBe 0
	it "should return a good result", ->
		expect(knapsack [2,3,4,5], [3,4,5,6], 5).toBe 7
		expect(knapsack [2], [1], 5).toBe 1
		expect(knapsack [20], [1], 5).toBe 0
		expect(knapsack [23,31,29,44,53,38,63,85,89,82],
			[92,57,49,68,60,43,67,84,87,72,], 165).toBe 309
