(defn palindromes [words]
  (vals (reduce (fn [acc a]
                  (let [key (sort a)]
                    (assoc acc key (conj (acc key #{}) a))))
                {}
                words)))

; ------------
(= (palindromes ["a"]) [#{"a"}])
(= (palindromes ["ab", "ab"]) [#{"ab"}])
(= (palindromes ["star" "rats" "car" "arc" "stars"])
   [#{"stars"} #{"arc" "car"} #{"rats" "star"}])
