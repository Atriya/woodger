; Woodger [1] in SNARK [2]
; Atriya Sen
; RAIR Lab, RPI

(assert
 '(forall (x y)
    (implies
      (T x y)
      (not (T y x))
  ) )
:name '1.2.1-axiom)

(assert
 '(forall (x y i)
      (implies
        (not (exists (p)
          (and
            (P p x)
            (T y p)
        ) ) )
        (implies
          (T y i)
          (T x i)
  ) ) )
:name '1.2.3-axiom)

(assert
 '(forall (x y i)
      (implies
        (not (exists (p)
          (and
            (P p x)
            (T p y)
        ) ) )
        (implies
          (T i y)
          (T i x)
  ) ) )
:name '1.2.4-axiom)

(assert
 '(forall (u v m)
    (implies
      (member m mom)
      (implies
        (and
          (P u m)
          (P v m)
        )
        (not (or
          (T u v)
          (T v u)
  ) ) ) ) )
:name '1.3.1-definition)

(assert
 '(forall (x y z)
    (implies
      (and (and
        (T x y)
        (P y z))
        (member z mom)
      )
      (T x z)
  ) )
:name '1.3.3-lemma)

(assert
 '(forall (x y z)
    (implies
      (and (and
        (P x y)
        (T x z))
        (member y mom)
      )
      (T y z)
  ) )
:name '1.3.4-lemma)

(prove
 '(forall (x y z)
    (implies
      (and
        (and
          (not (or (T x y) (T y x)))
          (and (member x mom) (member y mom))
        )
        (and
          (not (or (T y z) (T z y)))
          (and (member y mom) (member z mom))
        )
      )
      (not (or (T x z) (T z x)))
  ) )
:name '1.3.6-theorem)

; [1] J. H. Woodger, The Axiomatic Method in Biology (1937). Cambridge, U.K.: Cambridge University Press.
; [2] http://www.ai.sri.com/~stickel/snark.html