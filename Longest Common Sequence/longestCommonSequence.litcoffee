# Longest Common Subsequence of Two Sequences

**NOTE:** not working right now!

e.g.
`[17,12,23,22,7,134,15,24]` and `[2,5,6,12,7,13,14,134,15]`
output `[12,7,134,15]`

    longestCommonSequence = (input1, input2) ->
        output = []
        index2 = 0
        for i in [0...input1.length]
            j = index2
            for j in [index2...input2.length]
                if input1[i] is input2[j]
                    output.push input1[i]
                    i++
                    index2 = j + 1
        return output

    module.exports = longestCommonSequence
