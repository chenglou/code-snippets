; first iteration
; (defn fib-impl [n mem]
;   (if (@mem n)
;     (@mem n)
;     (do
;       (swap! mem assoc n (+ (fib-impl (- n 1) mem) (fib-impl (- n 2) mem)))
;       (@mem n))))

; (defn fib [n] (let [mem (atom {0 0 1 1})] (fib-impl n mem)))

; second iteration
(defn gen-fib [a b] (cons a (lazy-seq (gen-fib b (+ a b)))))
(defn fib [n] (nth (gen-fib 0 1) n))

;-------------
(assert (= (fib 0) 0))
(assert (= (fib 1) 1))
(assert (= (fib 6) 8))
(assert (= (fib 50) 12586269025))
