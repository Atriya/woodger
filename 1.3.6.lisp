; Woodger [1] in SNARK [2]
; Atriya Sen
; RAIR Lab, RPI

; Proof of 1.3.6 from {1.2.1, 1.2.3, 1.2.4, 1.3.1, 1.3.3, 1.3.4} :-

; 1.2.1 AXIOM
; The relation 'before in time' is asymmetrical:
(assert
 '(forall (x y)
    (implies
      (before-in-time x y)
      (not (before-in-time y x))
  ) )
:name '1.2.1)

; 1.2.3 AXIOM
; If no part of x is after y then x precedes everything that y precedes (in time):
(assert
 '(forall (x y i)
      (implies
        (not (exists (p)
          (and
            (part-of p x)
            (before-in-time y p)
        ) ) )
        (implies
          (before-in-time y i)
          (before-in-time x i)
  ) ) )
:name '1.2.3)

; 1.2.4 AXIOM
; If no part of x precedes y in time then everything that precedes y also precedes x:
(assert
 '(forall (x y i)
      (implies
        (not (exists (p)
          (and
            (part-of p x)
            (before-in-time p y)
        ) ) )
        (implies
          (before-in-time i y)
          (before-in-time i x)
  ) ) )
:name '1.2.4)

; 1.3.1 DEFINITION
; The class of momentary things is defined as those in which no part is before in time to another:
(assert
 '(forall (u v m)
    (implies
      (member m mom)
      (implies
        (and
          (part-of u m)
          (part-of v m)
        )
        (not (or
          (before-in-time u v)
          (before-in-time v u)
  ) ) ) ) )
:name '1.3.1)

; 1.3.3 LEMMA
; If xTy and yPz and z is momentary then xTz:
(assert
 '(forall (x y z)
    (implies
      (and
        (and
          (before-in-time x y)
          (part-of y z)
        )
        (member z mom)
      )
      (before-in-time x z)
  ) )
:name '1.3.3)

; 1.3.4 LEMMA
; If xPy and y is momentary and xTz then yTz:
(assert
 '(forall (x y z)
    (implies
      (and
        (and
          (part-of x y)
          (before-in-time x z)
        )
        (member y mom)
      )
      (before-in-time y z)
  ) )
:name '1.3.4)

; 1.3.6 THEOREM
; The relation of being neither before nor after, if its field is limited to momentary things, is transitive:
(prove
 '(forall (x y z)
    (implies
      (and
        (and
          (not (or (before-in-time x y) (before-in-time y x)))
          (and (member x mom) (member y mom))
        )
        (and
          (not (or (before-in-time y z) (before-in-time z y)))
          (and (member y mom) (member z mom))
        )
      )
      (not (or (before-in-time x z) (before-in-time z x)))
  ) )
:name '1.3.6)

; [1] J. H. Woodger, The Axiomatic Method in Biology (1937). Cambridge, U.K.: Cambridge University Press.
; [2] http://www.ai.sri.com/~stickel/snark.html