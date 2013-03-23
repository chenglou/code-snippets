squareRoot = require '../squareRoot'

describe "Get the square root of a number", ->
	it "should return a good result on edge cases", ->
		expect(squareRoot 0).toBeCloseTo 0, 10
		expect(squareRoot 1).toBeCloseTo 1, 10
		expect(squareRoot 2).toBeCloseTo Math.sqrt(2), 10
	it "should work on decimal numbers", ->
		expect(squareRoot 1.5).toBeCloseTo Math.sqrt(1.5), 10
		expect(squareRoot Math.PI).toBeCloseTo Math.sqrt(Math.PI), 10
		expect(squareRoot Math.E).toBeCloseTo Math.sqrt(Math.E), 10
	it "should work normally", ->
		for i in [0..99]
			testCase = Math.random() * 9999
			expect(squareRoot testCase).toBeCloseTo Math.sqrt(testCase), 10
	it "should return undefined for negative input", ->
		expect(squareRoot -1).toBeUndefined()
		expect(squareRoot -9).toBeUndefined()