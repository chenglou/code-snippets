diff = require '../levenshteinDistance'

describe "Levenstein distance between two strings", ->
	it "should return the good result", ->
        expect(diff "", "").toBe 0
        expect(diff " ", " ").toBe 0
        expect(diff "apple", "orange").toBe 5
        expect(diff "kitten", "sitting").toBe 3
        expect(diff "abcd", "jabc").toBe 2
        expect(diff "aa", "a a").toBe 1
        expect(diff "aa", "").toBe 2
