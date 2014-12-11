; One possible set of axioms of set theory, from AIMA [1], Section 8.3.
; EmptySet and the binary function 'adjoin' are the fundamental concepts.

(assert
 '(forall (?s)
    (iff
      (set ?s)
      (or
        (= ?s EmptySet)
        (exists (?x ?s2)
          (and
            (set ?s2)
            (= ?s (adjoin ?x ?s2))
  ) ) ) ) )
:name 'one)

(assert
 '(not (exists (?x ?s)
    (= (adjoin ?x ?s) EmptySet)
  ))
:name 'two)

(assert
 '(forall (?x ?s)
    (iff
      (member ?x ?s)
      (= ?s (adjoin ?x ?s))
  ) )
:name 'three)

(assert
 '(forall (?x ?s)
    (iff
      (member ?x ?s)
      (exists (?y ?s2)
        (and
          (= ?s (adjoin ?y ?s2))
          (or
            (= ?x ?y)
            (member ?x ?s2)
  ) ) ) ) )
:name 'four)

(assert
:name '5) ; subset

(assert
:name '6) ; set equality

(assert
:name '7) ; set intersection

(assert
:name '8) ; set union

; [1]
