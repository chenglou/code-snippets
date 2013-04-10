# Find Reverse Root

[Original link](http://acm.timus.ru/problem.aspx?space=1&num=1001)

Input: a set of integer numbers separated by any number of spaces and line
breaks.

Output: For each number from the last one till the first one, output its square
root, each in a separate line with at least four digits after decimal point.
**Use multiple methods.**

    fs = require 'fs'

    rawInput = null
    output = null
    init = ->
        rawInput = fs.readFileSync('input.txt', 'utf8')
        output = ''

    end = ->
        fs.writeFile('output.txt', output)
        
    reverseRoot1 = ->
        init()
        content = rawInput.split('\n')
        numbers = rawInput.split(' ')

        for i in [numbers.length - 1..0]
            number = parseInt(numbers[i])
            if not isNaN(number)
                output += Math.sqrt(number).toFixed(4) + '\n'
        end()

    reverseRoot2 = ->
        init()
        numbers = rawInput.match(/\d+/g)

        for i in [numbers.length - 1..0]
            number = parseInt(numbers[i])
            output += Math.sqrt(number).toFixed(4) + '\n'
        end()

    reverseRoot3 = ->
        init()
        numbers = []
        numberString = ''

Add a line feed as to not handle end of file special case in the loop below.
Might be a bad idea to modify variables without telling.
        
        rawInput += '\n'
        for i in [0...rawInput.length]
            if rawInput[i] isnt ' ' and rawInput[i] isnt '\n'
                numberString += rawInput[i]
            else
                if i isnt 0 and rawInput[i - 1] isnt ' ' and rawInput[i - 1] isnt '\n'
                    numbers.push(parseInt(numberString))
                    numberString = ''

        for i in [numbers.length - 1..0]
            number = parseInt(numbers[i])
            output += Math.sqrt(number).toFixed(4) + '\n'
        end()

    module.exports =
        "reverseRoot1": reverseRoot1
        "reverseRoot2": reverseRoot2
        "reverseRoot3": reverseRoot3
