GCD = require '../'

describe "Greatest common divisor", ->
  it "should return 0 on 0, 0", ->
    expect(GCD 0, 0).toBe 0
  it "should return the number if the other number's 0", ->
    expect(GCD 1, 0).toBe 1
    expect(GCD 0, 1).toBe 1
    expect(GCD 0, -3).toBe -3
  it "should return the number if both are same", ->
    expect(GCD 1, 1).toBe 1
    expect(GCD 2, 2).toBe 2
    expect(GCD 3, 3).toBe 3
  it "should find the GCD", ->
    expect(GCD 3, 9).toBe 3
    expect(GCD 9, 3).toBe 3
    expect(GCD 7, -15).toBe -1
    expect(GCD 4, 8).toBe 4

