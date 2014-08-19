; Woodger [1] in SNARK [2]
; Atriya Sen
; RAIR Lab, RPI

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
 '(forall (x y)
    (implies
      (Sl x y)
      (and
        (member y org)
        (and
          (member x mom)
          (and
            (P x y)
            (not (exists (z)
              (and
                (P z y)
                (and
                  (member z mom)
                  (and
                    (not (= z x))
                    (P x z)
                  )
                )
              )
            ) )
          )
        )
      )
    )
  )
:name '1.4.1-definition)

(assert
 '(forall (x)
    (implies
      (member x org)
      (forall (y z)
        (and
          (implies
            (and
              (T y z)
              (and
                (Sl y x)
                (Sl z x)
              )
            )
            (and
              (and
                (T y yz)
                (and
                  (Sl y x)
                  (Sl yz x)
                )
              )
              (and
                (T yz z)
                (and
                  (Sl yz x)
                  (Sl z x)
                )
              )
            )
          )
          (and p p) ; @todo: Dedekindian
        )
      )
    )
  )
:name '1.4.2-axiom)

(assert
 '(forall (x y)
    (implies
      (B x y)
      (and
        (member y org)
        (and
          (= x s)
          (forall (z)
            (and
              (Sl z y)
              (T s z)
            )
          ) ; s is the earliest slice of y
        ) ; x is the earliest slice of y
      )
    )
  )
:name '1.5.1-definition)

(assert
 '(forall (x y)
    (implies
      (B x y)
      (and
        (member y org)
        (and
          (= x s)
          (forall (z)
            (and
              (Sl z y)
              (T z s)
            )
          ) ; s is the latest slice of y
        ) ; x is the latest slice of y
      )
    )
  )
:name '1.5.2-definition)  

(assert
 '(forall (x y)
    (implies
      (U x y)
      (and
        (and
          (member x org)
          (member y org)
        )
        (or
          (and
            (exists (fy lx)
              (and
                (and (B fy y) (E lx x))
                (and (P fy lx) (not (= fy lx)))
              )
            )
          ) ; The first slice of y is part of but not identical to the last slice of x
          (and
            (exists (fy lx)
              (and
                (and (B fy y) (E lx x))
                (and (P lx fy) (not (= fy lx)))
              )
            )
          ) ; The last slice of x is part of but not identical to the first slice of y
        ) ; Either of these is true.
      )
    )
  )
:name '1.6.1-axiom)

(prove
 '(and
    (forall (x y)
      (implies
        (U y x)
        (not (U x y))
      )
    ) ; U is asymmetrical
    (forall (x y z)
      (implies
        (and (U x y) (U y z))
        (not (U x z))
      )
    ) ; U is intransitive
  ) ; U is asymmetrical and intransitive
:name '1.6.12-theorem)

; [1] J. H. Woodger, The Axiomatic Method in Biology (1937). Cambridge, U.K.: Cambridge University Press.
; [2] http://www.ai.sri.com/~stickel/snark.html
