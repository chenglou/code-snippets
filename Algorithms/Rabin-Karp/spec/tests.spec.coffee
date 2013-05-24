rabinKarp = require '../rabinKarp'

describe "Find substring", ->
    it "should find them on edges", ->
        expect(rabinKarp "helloa", "he").toBe 0
        expect(rabinKarp "helloa", "oa").toBe 4
    it "should work on single letters", ->
        expect(rabinKarp "helloa", "h").toBe 0
        expect(rabinKarp "helloa", "a").toBe 5
        expect(rabinKarp "helloa", "l").toBe 2
        expect(rabinKarp "helloa", "o").toBe 4
        expect(rabinKarp "helloa", "e").toBe 1
    it "should work on whole string match", ->
        expect(rabinKarp "hello", "hello").toBe 0
    it "should return -1 if the substring's longer", ->
        expect(rabinKarp "hello", "helloo").toBe -1
        expect(rabinKarp "h", "helloo").toBe -1
    it "should work on empty string", ->
        expect(rabinKarp "", "asd").toBe -1
    it "should return position 0 if substring's empty", ->
        expect(rabinKarp "asd", "").toBe 0
        expect(rabinKarp "", "").toBe 0
