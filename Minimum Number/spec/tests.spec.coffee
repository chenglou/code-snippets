jasmine = require 'jasmine-node'
minimumNumber = require '../minimumNumber'

describe "Get the minimum natural number", ->
	it "should return a good result on normal cases", ->
		expect(minimumNumber([0, 1, 2, 3, 5, 7, 8, 13])).toBe(4)
		expect(minimumNumber([7, 3, 2, 1, 13, 0, 8, 5])).toBe(4)
		expect(minimumNumber([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])).toBe(10)
		expect(minimumNumber([8, 4, 2, 1, 0, 3, 5, 6, 7, 9, 15, 20, 30])).toBe(10)

	it "should return a good result on empty cases", ->
		expect(minimumNumber([0])).toBe(1)
		expect(minimumNumber([2])).toBe(0)

	it "should return the good number even when there are negative numbers", ->
		expect(minimumNumber([-1, 0, 1, 2, 3, 5, 7, 8, 13])).toBe(4)
		expect(minimumNumber([-1, 1, 2, 3, 5, 7, 8, 13])).toBe(0)
		expect(minimumNumber([-1])).toBe(0)