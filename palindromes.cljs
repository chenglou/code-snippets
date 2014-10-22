(defn sort-letters [w] (clojure.string/join "" (sort w)))

(defn palindromes [words]
  (vals (reduce (fn [acc a]
                  (let [sorted (sort-letters a)]
                    (assoc acc sorted (conj (acc sorted #{}) a))))
                {}
                words)))

; ------------
(= (palindromes ["a"]) [#{"a"}])
(= (palindromes ["ab", "ab"]) [#{"ab"}])
(= (palindromes ["star" "rats" "car" "arc" "stars"])
   [#{"stars"} #{"arc" "car"} #{"rats" "star"}])
