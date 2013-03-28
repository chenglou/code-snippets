# Karatsuba Algorithm.
Fast integer multiplication algorithm in O(n^1.58), where 1.58 = log2(3).

    multiply = (x, y) ->
        if (x < 10 and y < 10) then return x * y

        lowerChunkSize = Math.max Math.floor(lengthOf(x) / 2), Math.floor(lengthOf(y) / 2)
        
x1: upper chunk of x. x0: lower chunk.
`x = x1 * 10^upperChunk + x0`. Passing lower chunk is easier to compute.
        
        [x1, x0] = chop x, lowerChunkSize
        [y1, y0] = chop y, lowerChunkSize

Let n = upper chunk
`xy = (x1 * 10^n + x0)(y1 * 10^n/2 + y0)
   = x1y1 * 10^n + (x1y0 + x0y1) * 10^n/2 + x0y0`
The whole trick lies in the middle part:
`(x1y0 + x0y1)` can be expressed as `(x1 + x0)(y1 + y0) - x1y1 - x0y0`

        middle = multiply x1 + x0, y1 + y0
        x1y1 = multiply x1, y1
        x0y0 = multiply x0, y0
        return x1y1 * Math.pow(10, lowerChunkSize * 2) + (middle - x1y1 - x0y0) * Math.pow(10, lowerChunkSize) + x0y0

    chop = (number, lowerChunkSize) ->

Use parseInt instead of Math.floor, which doesn't give the desired output for negative numbers.
        
        upper = parseInt(number / Math.pow 10, lowerChunkSize)
        lower = number % Math.pow 10, lowerChunkSize
        return [upper, lower]

    lengthOf = (number) ->
        Math.abs(number).toString().length

    module.exports = multiply
