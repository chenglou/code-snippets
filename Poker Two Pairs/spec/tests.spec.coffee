twoPairs = require '../'

validate = (result) ->
	expect(result[0][0]).toBe result[1][0]
	expect(result[2][0]).toBe result[3][0]

	expect(result[0][1]).not.toBe result[1][1]
	expect(result[2][1]).not.toBe result[3][1]

	expect(result[4][0]).not.toBe result[0][0]
	expect(result[4][0]).not.toBe result[2][0]

describe "Get a two pairs poker hand", ->
	it "should return a good result", ->
		for i in [0..10]
			result = twoPairs()
			validate result
