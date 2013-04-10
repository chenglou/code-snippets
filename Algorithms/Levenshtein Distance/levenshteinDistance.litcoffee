# Levenshtein Distance

Find the "editing distance" between two strings.

Recursive version with memoization. `i` and `j` are for tracking the progress,
mainly for hashing a unique key for the lookup table.

    levenshteinDistance = (string1, string2, i = 0, j = 0, lookupTable = {}) ->
        key = i + "|" + string1.length + "|" + j + "|" + string2.length
        if lookupTable[key]? then return lookupTable[key]
        if string1.length is 0 then return string2.length
        if string2.length is 0 then return string1.length

        cost = 0
        if string1[string1.length - 1] isnt string2[string2.length - 1]
            cost = 1
        slicedString1 = string1[0...string1.length - 1]
        slicedString2 = string2[0...string2.length - 1]
        distance = Math.min levenshteinDistance(slicedString1, string2, i + 1, j, lookupTable) + 1,
                        levenshteinDistance(string1, slicedString2, i, j + 1, lookupTable) + 1,
                        levenshteinDistance(slicedString1, slicedString2, i + 1, j + 1, lookupTable) + cost
        lookupTable[key] = distance
        return distance

    module.exports = levenshteinDistance