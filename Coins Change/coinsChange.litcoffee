# Coins Change

Given a total amount and a few types of coin, find the change.

    FLOATING_TOFIXED_POSITION = 10
    coinsChange = (goalAmount, changeArray) ->
        if goalAmount < 0 then throw new Error("Total amount should be positive.")

        remainingChange = goalAmount
        finalChangeCombination = []

Default the change array elements to 0. While at it, check for invalid $0 change.

        for i in [0...changeArray.length]
            if changeArray[i] <= 0 then throw new Error("Invalid change coins found: " + changeArray[i])
            finalChangeCombination[i] = 0

        changeArray.sort((a, b) -> b - a)

        currentCoinIndex = 0

        computeCombination = ->
            while currentCoinIndex < changeArray.length
                finalChangeCombination[currentCoinIndex] = parseInt(remainingChange / changeArray[currentCoinIndex])

Use toFixed(10) to avoid floating point operation error.

                remainingChange = (remainingChange - changeArray[currentCoinIndex] * finalChangeCombination[currentCoinIndex]).toFixed(FLOATING_TOFIXED_POSITION)
                currentCoinIndex++

Do a greedy run to have a quick estimate of coins change using modulo.

        computeCombination()
        currentCoinIndex = changeArray.length - 1

Go back and adjust. More floating point correction.

        while remainingChange isnt (0).toFixed(FLOATING_TOFIXED_POSITION) and currentCoinIndex > 0

Keep the amount. currentCoinIndex will be changed by computeCombination.

            tempCurrentCoinsIndex = 0
            tempCurrentCoinIndex = --currentCoinIndex
            remainingChange = goalAmount
            if finalChangeCombination[currentCoinIndex] is 0
                continue
            else
                finalChangeCombination[currentCoinIndex] = finalChangeCombination[currentCoinIndex] - 1

            for i in [0..currentCoinIndex]
                remainingChange = (remainingChange - finalChangeCombination[i] * changeArray[i]).toFixed(FLOATING_TOFIXED_POSITION)

            currentCoinIndex++
            computeCombination()
            currentCoinIndex = tempCurrentCoinIndex

        return finalChangeCombination

    module.exports = coinsChange
    