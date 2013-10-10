{iterativeBinarySearch, recursiveBinarySearch, continuationBinarySeach} =
	require '../'

test = (method) ->
	it "should return -1 on empty array", ->
		expect(method 1, []).toBe -1
	it "should return -1 if the item's not found", ->
		expect(method 1, [0]).toBe -1
		expect(method 1, [3]).toBe -1
		expect(method 1, [0, 2]).toBe -1
	it "should return the index of the found item", ->
		expect(method 5, [1, 2, 4, 5, 6, 7]).toBe 3
		expect(method 5, [-1, 5, 2]).toBe 1
	it "should behave correctly on edges", ->
		expect(method 5, [5]).toBe 0
		expect(method 5, [1, 5]).toBe 1
		expect(method 5, [5, 6]).toBe 0

describe "Iterative binary search", ->
	test iterativeBinarySearch

describe "Recursive binary search", ->
	test recursiveBinarySearch

describe "Continuation binary search", ->
	test continuationBinarySeach
