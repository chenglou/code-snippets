(defn fib-impl [n mem]
  (if (@mem n)
    (@mem n)
    (do
      (swap! mem assoc n (+ (fib-impl (- n 1) mem) (fib-impl (- n 2) mem)))
      (@mem n))))

(defn fib [n] (let [mem (atom {0 0 1 1})] (fib-impl n mem)))

;-------------
(assert (= (fib 0) 0))
(assert (= (fib 1) 1))
(assert (= (fib 6) 8))
(assert (= (fib 50) 12586269025))
