fib = require '../fibonacci'

table = [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765]
test = (fn) ->
	expect(fn i).toBe table[i] for i in [0...table.length] 

describe "Fibonacci", ->
	it "Uses iteration", ->
		test fib.fibLoop
	it "Uses iteration plus memoization", ->
		test fib.fibLoopMemoization
	it "Uses recursion", ->
		test fib.fibRecursive
	it "Uses recursion plus memoization", ->
		recursiveMemoization = fib.makeFibRecursiveMemoization()
		test recursiveMemoization
	it "Uses golde ratio", ->
		test fib.fibGoldenRatio
	it "should be the same for every method on bigger numbers", ->
		recursiveMemoization = fib.makeFibRecursiveMemoization()
		for i in [table.length + 1..table.length + 10]
			# Assuming the basic version is right
			result = fib.fibLoop i
			expect(fib.fibLoopMemoization i).toBe result
			expect(fib.fibRecursive i).toBe result
			expect(recursiveMemoization i).toBe result
			expect(fib.fibGoldenRatio i).toBe result
