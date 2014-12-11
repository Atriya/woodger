; NBG [1] in SNARK [2]
; Atriya Sen
; RAIR Lab, RPI

(assert
 '(forall (x y)
    (iff
      (subclass x y)
      (forall (u)
        (implies
          (member u x)
          (member u y)
        )
      )
    )
  )
:name 'def-subclass)

(assert
 '(forall (x)
    (subclass x V)
  )
:name 'A-2)

(assert
 '(forall (x y)
    (iff
      (= x y)
      (and
        (subclass x y)
        (subclass y x)
      )
    )
  )
:name 'A-3)

(assert
 '(forall (u x y)
    (iff
      (member u (unordered-pair x y))
      (and
        (member u V)
        (or
          (= u x)
          (= u y)
        )
      )
    )
  )
:name 'A-4-1)

(assert
 '(forall (x y)
    (member (unordered-pair x y) V)
  )
:name 'A-4-2)

(assert
 '(forall (x)
    (=
      (singleton x)
      (unordered-pair x x)
    )
  )
:name 'def-singleton-set)

; [1]
; [2]
