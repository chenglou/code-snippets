# Roman to Arabic Numeral Converter

romanToArabic = (string) ->
  letters = M: 1000, D: 500, C: 100, L: 50, X: 10, V: 5, I: 1
  string.split('').reduce(((accum, letter, i, array) ->
    value = letters[letter]
    return accum + value * if letters[array[i + 1]] > value then -1 else 1
  ), 0)

module.exports = romanToArabic
