(defn make-sieve [s]
  (let [head (first s)]
    (cons head (lazy-seq (make-sieve (filter #(pos? (mod % head))
                                             (rest s)))))))

(def sieve (make-sieve (iterate inc 2))) ; pass in natural nums starting from 2

; ----------
(assert (= (take 10 sieve) [2 3 5 7 11 13 17 19 23 29]))
