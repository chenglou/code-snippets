; first iteration
; (defn sort-letters [w] (clojure.string/join "" (sort w)))

; (defn anagram [words]
;   (vals (reduce (fn [acc a]
;                   (let [key (sort-letters a)]
;                     (assoc acc key (conj (acc key []) a))))
;                 {}
;                 words)))

; second iteration
; (defn anagram [words]
;   (vals (reduce (fn [acc a] (update-in acc [(sort a)] (fnil conj []) a))
;                 {}
;                 words)))

; final form
(defn anagram [words] (vals (group-by sort words)))

; ------------
(= (anagram ["a"]) [["a"]])
(= (anagram ["ab" "ba"]) [["ab" "ba"]])
(= (anagram ["star" "rats" "car" "arc" "stars"])
   [["star" "rats"] ["car" "arc"] ["stars"]])
