binarySearch = require '../binarySearch'

describe "Binary search", ->
		it "should return -1 on empty array", ->
				expect(binarySearch 1, []).toBe -1
		it "should return -1 if the item's not found", ->
				expect(binarySearch 1, [0]).toBe -1
				expect(binarySearch 1, [3]).toBe -1
				expect(binarySearch 1, [0, 2]).toBe -1
		it "should return the index of the found item", ->
				expect(binarySearch 5, [1, 2, 4, 5, 6, 7]).toBe 3
				expect(binarySearch 5, [-1, 5, 2]).toBe 1
		it "should behave correctly on edges", ->
				expect(binarySearch 5, [5]).toBe 0
				expect(binarySearch 5, [1, 5]).toBe 1
				expect(binarySearch 5, [5, 6]).toBe 0

