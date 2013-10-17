romanToArabic = require '../'

describe "Convert roman numbers to arabic representation", ->
  it "should return the correct number", ->
    expect(romanToArabic 'I').toBe 1
    expect(romanToArabic 'II').toBe 2
    expect(romanToArabic 'IV').toBe 4
    expect(romanToArabic 'MDCLXVI').toBe 1666
    expect(romanToArabic 'MMXI').toBe 2011
    expect(romanToArabic 'MIM').toBe 1999
    expect(romanToArabic 'MCMXC').toBe 1990
    expect(romanToArabic 'MCMLVI').toBe 1956
    expect(romanToArabic 'MCMIV').toBe 1904
