fibLoop = (n) ->
    if n is 1 or n is 2 then return 1
    if n is 0 then return 0
    prev = 1
    prevPrev = 1
    for i in [1..n - 2]
        current = prev + prevPrev
        prevPrev = prev
        prev = current
    return current

fibLoopMemoization = (n) ->
    if n is 1 or n is 2 then return 1
    if n is 0 then return 0
    arr = [1, 1]
    current = 3
    while current <= n
        arr.push arr[current - 2] + arr[current - 3]
        current++
    return arr[n - 1]

fibRecursive = (n) ->
    if n is 1 or n is 2 then return 1
    if n is 0 then return 0
    return fibRecursive(n - 1) + fibRecursive(n - 2)

makeFibRecursiveMemoization = ->
    cache = {0: 0, 1: 1, 2: 1}
    return _fibRecursiveMemoization = (n) ->
        if n <= 2 or cache[n]? then return cache[n]
        else
            return _fibRecursiveMemoization(n - 1) + _fibRecursiveMemoization(n - 2)

# Doesn't belong here, but kind of neat.
fibGoldenRatio = (n) ->
    squareRootOf5 = Math.sqrt 5
    a = Math.pow (1 + squareRootOf5) / 2, n
    b = Math.pow (1 - squareRootOf5) / 2, n
    return Math.round (a - b) / squareRootOf5

module.exports =
    fibLoop: fibLoop
    fibLoopMemoization: fibLoopMemoization
    fibRecursive: fibRecursive
    makeFibRecursiveMemoization: makeFibRecursiveMemoization
    fibGoldenRatio: fibGoldenRatio


