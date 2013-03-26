Dynamic programming.

    string1 = "kitten"
    string2 = "kitt en"

    levenshteinDistance = (string1, string2) ->
        if string1.length is 0 then return string2.length
        if string2.length is 0 then return string1.length
        if string1[string1.length - 1] is string2[string2.length - 1]
            cost = 0
        else cost = 1
        return Math.min levenshteinDistance(string1[0...string1.length - 1], string2) + 1,
                        levenshteinDistance(string1, string2[0...string2.length - 1]) + 1,
                        levenshteinDistance(string1[0...string1.length - 1], string2[0...string2.length - 1]) + cost

    console.log levenshteinDistance string1, string2
