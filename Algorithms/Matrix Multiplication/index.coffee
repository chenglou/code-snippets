# Matrix Multiplication

_mapRange = (arr, start, end, func) -> func i for i in [start...end]

matrixMultiply = (mat1, mat2) ->
  return [] if mat1.length isnt mat2[0]?.length
  # return me a matrix
  mat1.map (row1) ->
    # return me a row
    _mapRange row1, 0, mat2[0].length, (j) ->
      # return me a cell
      mat2
        .map((row2, k) -> row1[k] * mat2[k][j])
        .reduce (x, y) -> x + y

module.exports = matrixMultiply
