{fibLoop,
fibLoopMemoization,
fibRecursive,
fibRecursiveMemoization,
fibGoldenRatio} = require '../'

table = [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765]
test = (fn) ->
	expect(fn i).toBe table[i] for i in [0...table.length]

describe "Fibonacci", ->
	it "Uses iteration", ->
		test fibLoop
	it "Uses iteration plus memoization", ->
		test fibLoopMemoization
	it "Uses recursion", ->
		test fibRecursive
	it "Uses recursion plus memoization", ->
		test fibRecursiveMemoization
	it "Uses golde ratio", ->
		test fibGoldenRatio
	it "should be the same for every method on bigger numbers", ->
		for i in [table.length + 1..table.length + 10]
			# Assuming the basic version is right
			result = fibLoop i
			expect(fibLoopMemoization i).toBe result
			expect(fibRecursive i).toBe result
			expect(fibRecursiveMemoization i).toBe result
			expect(fibGoldenRatio i).toBe result
