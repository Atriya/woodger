; Tarski's Axioms of Mereology, in SNARK [1].

; Taken from Appendix E of Woodger [2].
; Here, Tarski is indebted to Leśniewski's Mereology [3].

(assert
;;{{{
 '(forall (y alpha)
    (iff
      (sum-of y alpha)
      (and
        (forall (p)
          (implies
            (member p alpha)
            (part-of p y)
          )
        )
        (forall (z)
          (implies
            (part-of z y)
            (exists (q)
              (and
                (exists (r)
                  (and
                    (member r alpha)
                    (part-of q r)
                  )
                )
                (part-of q z)
              )
            )
          )
        )
      )
    )
  )
;;}}}
:name '1.1-definition)

(assert
;;{{{
 '(forall (x y z)
    (implies
      (and
        (part-of x y)
        (part-of y z)
      )
      (part-of x z)
  ) )
;;}}}
:name '1.11-axiom)

(assert
;;{{{
 '(forall (x y alpha)
    (implies
      (and
        (member x alpha)
        (and
          (not (exists (z)
            (and
              (member z alpha)
              (not (= z x))
          )) )
          (sum-of y alpha)
      ) )
      (= x y)
  ) )
;;}}}
:name '1.12-axiom)

(assert
;;{{{
 '(forall (alpha)
    (implies
      (exists (p)
        (member p alpha)
      )
      (exists (q)
        (sum-of q alpha)
  ) ) )
;;}}}
:name '1.13-axiom)

(assert
;;{{{
 '(forall (x y alpha)
    (implies
      (and
        (and
          (member x alpha)
          (not (exists (z)
            (and
              (member z alpha)
              (not (= x z))
            )
          ))
        )
        (sum-of y alpha)
      )
      (= x y)
    )
  )
;;}}}
:name '1.21-lemma) ; Proved from {1.12, 1.13} (without 1.1), as stated by Tarski.

(prove
 '(forall (x)
    (part-of x x)
  )
:name '1.22-lemma-alt)

(prove
;;{{{
 '(forall (x y)
    (implies
      (= x y)
      (part-of x y)
  ) )
;;}}}
:name '1.22-lemma) ; should be provable from {1.21, 1.1}.

(prove
;;{{{
 '(forall (x y)
    (implies
      (and
        (part-of x y)
        (part-of y x)
      )
      (= x y)
    )
  )
;;}}}
:name '1.23-lemma) ; should be provable from {1.11, 1.22, 1.1, 1.12}.

; Theorems 1.24-1.27 are also deducible, among others.

; [1]
; [2]
; [3]
