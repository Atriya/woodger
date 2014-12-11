(load "~/Applications/snark-2012/snark-system.lisp")
(make-snark-system)
(initialize)
(use-resolution)
(use-paramodulation)

; A tentative attempt at building an imitation of a higher-order function.
(assert
 '(forall (s x)
    (iff
      (parts-of s x)
      (and
        (set s)
        (forall (m)
          (implies
            (membership m s)
            (part-of m x) ; can't replace part-of with a var - HOL needed?
          )
        )
      )
    )
  )
:name 'parts-of)

; now build subset, intersection, and so on... However, may be MUCH simpler not to!
