; Woodger [1] in SNARK [2]
; Atriya Sen
; RAIR Lab, RPI

; Proof of 1.6.12 from {} :-

; 1.4.1 DEFINITION

; 1.4.2 AXIOM

; 1.5.1 DEFINITION

; 1.5.2 DEFINITION  

; 1.6.1 AXIOM
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
              (and (first-slice fy y) (last-slice lx x))
              (and (part-of fy lx) (not (= fy lx)))
            )
          ) ; The first slice of y is part of but not identical to the last slice of x
          (and
            (exists (fy lx)
              (and (first-slice fy y) (last-slice lx x))
              (and (part-of lx fy) (not (= fy lx)))
            )
          ) ; The last slice of x is part of but not identical to the first slice of y
        ) ; Either of these is true.
      )
    )
  )
:name '1.6.1)

; 1.6.12 THEOREM
(assert
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
:name '1.6.12)

; [1] J. H. Woodger, The Axiomatic Method in Biology (1937). Cambridge, U.K.: Cambridge University Press.
; [2] http://www.ai.sri.com/~stickel/snark.html
