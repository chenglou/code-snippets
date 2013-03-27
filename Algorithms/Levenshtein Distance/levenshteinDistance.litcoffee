Dynamic programming.

    string1 = "asdafkjzcz"
    string2 = "ab cdsf"
    lookup = {}

    levenshteinDistance = (string1, string2, i, j) ->
        key = i + "|" + string1.length + "|" + j + "|" + string2.length
        if lookup[key]? then return lookup[key]
        if string1.length is 0 then return string2.length
        if string2.length is 0 then return string1.length

        cost = 0
        if string1[string1.length - 1] isnt string2[string2.length - 1]
            cost = 1
        slicedString1 = string1[0...string1.length - 1]
        slicedString2 = string2[0...string2.length - 1]
        distance = Math.min levenshteinDistance(slicedString1, string2, i + 1, j) + 1,
                        levenshteinDistance(string1, slicedString2, i, j + 1) + 1,
                        levenshteinDistance(slicedString1, slicedString2, i + 1, j + 1) + cost
        lookup[key] = distance
        return distance

    console.log levenshteinDistance string1, string2, 0, 0
