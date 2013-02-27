jasmine = require 'jasmine-node'
squareRoot = require '../squareRoot'

describe "Get the square root of a number", ->
	it "should return a good result on normal cases", ->
		expect(squareRoot(1)).toBeCloseTo(1, 10)
		expect(squareRoot(2)).toBeCloseTo(Math.sqrt(2), 10)
		expect(squareRoot(3)).toBeCloseTo(Math.sqrt(3), 10)
		expect(squareRoot(4)).toBeCloseTo(2, 10)
		expect(squareRoot(20)).toBeCloseTo(Math.sqrt(20), 10)
		expect(squareRoot(101)).toBeCloseTo(Math.sqrt(101), 10)
		expect(squareRoot(1234567890)).toBeCloseTo(Math.sqrt(1234567890), 10)

	it "should return 0 for 0", ->
		expect(squareRoot(0)).toBeCloseTo(0, 10)

	it "should work on decimal numbers", ->
		expect(squareRoot(1.5)).toBeCloseTo(Math.sqrt(1.5), 10)
		expect(squareRoot(Math.PI)).toBeCloseTo(Math.sqrt(Math.PI), 10)
		expect(squareRoot(Math.E)).toBeCloseTo(Math.sqrt(Math.E), 10)

	it "should error on negative results", ->
		expect(-> squareRoot(-1)).toThrow()
		expect(-> squareRoot(-9)).toThrow()