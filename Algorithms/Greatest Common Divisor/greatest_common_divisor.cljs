(defn gcd [a b]
  (if (= b 0)
    a
    (recur b (rem a b))))

; ----------
(assert (= 0 (gcd 0 0)))
(assert (= 1 (gcd 1 0)))
(assert (= 1 (gcd 0 1)))
(assert (= -3 (gcd 0 -3)))
(assert (= 1 (gcd 1 1)))
(assert (= 2 (gcd 2 2)))
(assert (= 3 (gcd 3 3)))
(assert (= 3 (gcd 3 9)))
(assert (= 3 (gcd 9 3)))
(assert (= -1 (gcd 7 -15)))
(assert (= 4 (gcd 4 8)))
