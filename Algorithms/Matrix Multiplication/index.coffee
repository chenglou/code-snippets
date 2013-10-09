# Matrix Multiplication

_mapRange = (start, end, func) -> func i for i in [start...end]

matrixMultiply = (matrix1, matrix2) ->
  return [] if matrix1.length isnt matrix2[0]?.length
  # return me a matrix
  matrix1.map (matrix1Row) ->
    # return me a row
    _mapRange 0, matrix2[0].length, (i) ->
      # return me a cell
      matrix2
        .map((row2, j) -> matrix1Row[j] * matrix2[j][i])
        .reduce (x, y) -> x + y

module.exports = matrixMultiply
