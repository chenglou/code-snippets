# Greatest Common Divisor
Check Euclidean algorithm for more information.

    GCD = (a, b) -> if b is 0 then a else GCD(b, a % b)

    module.exports = GCD
