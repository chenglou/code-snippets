# Copying

[Original link](http://acm.timus.ru/problem.aspx?space=1&num=1131)

A program has to be copied to N computers. At the moment the program is
installed only on one computer (one of the N computers). The only way to
transfer information from one computer to another is to copy it using a cable
that connects two computers directly. So, if the program is installed on a
computer, it can be copied to some other (but only one) computer within an hour.
There are only K cables.

Input: the only input line contains two integers separated with a space: N and K
(1 ≤ N ≤ 10^9; 1 ≤ K ≤ 10^9).

Output: minimal time (in hours) necessary to copy the program to all computers.

    fs = require 'fs'

    copying = ->
        input = fs.readFileSync('input.txt', 'utf8').split(' ')

Number of computers: n. Number of cables: k.

        n = parseInt(input[0])
        k = parseInt(input[1])

Total number of computers increase exponentially until number of cables fall short.
Step after which they fall short:

        s = Math.ceil(Math.log(k) / Math.log(2)) + 1

After that, linear growth. Add k cables each time until the total exceeds n
Number of steps needed:
        
        m = Math.ceil((n + 1 - Math.pow(2, s)) / k)

Total number of hours:

        output = m + s

        fs.writeFileSync('output.txt', output)

    module.exports = copying