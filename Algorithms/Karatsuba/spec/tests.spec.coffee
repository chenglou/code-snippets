multiply = require '../multiply'

describe "Multiplication", ->
	it "should return the good result", ->
		for i in [-50..50]
			for j in [-50..50]
				expect(multiply i, j).toBe i * j
	it "should work for random big numbers", ->
		for i in [1..100]
			number1 = Math.floor(Math.random() * 100001) - 50000
			number2 = Math.floor(Math.random() * 100001) - 50000
			expect(multiply number1, number2).toBe number1 * number2