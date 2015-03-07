(use '[clojure.core.match :only (match)])

(defn r-match [[r & rs :as R] [s & ss :as S]]
  (match [r s]
    [nil _] true
    [\* _] (or (r-match rs ss) (r-match rs S) (r-match R ss))
    [_ nil] false
    [(:or s \.) _] (r-match rs ss)
    :else false))

;-----------
(assert (r-match "" "a"))
(assert (not (r-match "b" "a")))
(assert (not (r-match "a" "")))
(assert (r-match "abc" "abcd"))
(assert (r-match "*" ""))
(assert (r-match "*" "a"))
(assert (r-match "*b" "b"))
(assert (r-match "*b*" "b"))
(assert (r-match "a*b" "acab"))
(assert (not (r-match "." "")))
(assert (r-match "a.b" "acb"))
(assert (not (r-match "a.b" "accb")))
