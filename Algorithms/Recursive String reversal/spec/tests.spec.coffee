recursiveStringReversal = require '../'

describe "Recursive string reversal", ->
	it "should reverse empty string", ->
		expect(recursiveStringReversal '').toBe ''

	it 'should reverse normal strings correctly', ->
		expect(recursiveStringReversal 'a').toBe 'a'
		expect(recursiveStringReversal 'abc').toBe 'cba'
		expect(recursiveStringReversal 'abcd').toBe 'dcba'
