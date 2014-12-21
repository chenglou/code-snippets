; Roman to Arabic Numeral Converter

(defn roman-arabic [str]
  (let [letters {\M 1000, \D 500, \C 100, \L 50, \X 10, \V 5, \I 1}
        values (map letters str)]
    (apply +
           (last values)
           (map #(if (< %1 %2) (- %1) %1) values (rest values)))))

(assert (= (roman-arabic "I") 1))
(assert (= (roman-arabic "II") 2))
(assert (= (roman-arabic "IV") 4))
(assert (= (roman-arabic "MDCLXVI") 1666))
(assert (= (roman-arabic "MMXI") 2011))
(assert (= (roman-arabic "MIM") 1999))
(assert (= (roman-arabic "MCMXC") 1990))
(assert (= (roman-arabic "MCMLVI") 1956))
(assert (= (roman-arabic "MCMIV") 1904))
