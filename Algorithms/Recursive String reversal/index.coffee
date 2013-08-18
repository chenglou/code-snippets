# Recursive String Reversal

recursiveStringReversal = (string) ->
  if string.length is 0
    ''
  else
    (recursiveStringReversal string.substr 1) + string[0]

module.exports = recursiveStringReversal
