# Find the Minimum

Given a set containing random distinct numbers in no
particular order (with gaps), what is the smallest natural number that is not
contained in the given set? The problem must be solved in O(n) to be intriguing.

Example: `[8 4 2 1 0 3 5 6 7 9 15 20 30] -> 10`

For input of length n, 0 <= the minimum element <= n

    minimumNumber = (input) ->
        minimumNumberTracker = []

Include mininumTracker[inputLength], thus length + 1 elements

        minimumNumberTracker = new Array(input.length + 1)

        for item in input
            if 0 <= item <= input.length then minimumNumberTracker[item] = true

        for item, i in minimumNumberTracker
            if !item then return i

    module.exports = minimumNumber