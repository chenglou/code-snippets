# Rabin-Karp Substring Finding

    rabinKarp = (text, substring) ->
        hashedSubstring = rollHash substring, 0, substring.length
        for i in [0..text.length - substring.length] by 1
            hashedTextChunk = rollHash text, i, substring.length, hashedTextChunk
            if hashedTextChunk is hashedSubstring
                if text[i...i + substring.length] is substring
                    return i
        return -1

Choose a good prime to avoid hashing collisions.

    rollHash = (string, startIndex, substringLength, initialHashValue) ->
        hashRadix = 101
        if not initialHashValue?
            hashedResult = 0
            for i in [0...substringLength]
                hashedResult += Math.pow(hashRadix, i) * string.charCodeAt i
        else
            hashedResult = initialHashValue
            if startIndex > 0
                hashedResult -= string.charCodeAt startIndex - 1
            hashedResult /= hashRadix
            hashedResult += Math.pow(hashRadix, substringLength - 1) *
                            string.charCodeAt startIndex - 1 + substringLength
        return hashedResult

    module.exports = rabinKarp
