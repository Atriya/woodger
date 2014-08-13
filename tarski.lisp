; Tarski's Axioms of Mereology, in SNARK [1].

; Taken from the English translation [2] (from the French) of [3].
; The translation is due to Joseph Henry Woodger.
; Here, Tarski is indebted to Leśniewski's Mereology [4].

(assert
;;{{{
 '(forall (y alpha)
    (implies
      (sum-of y alpha)
      (and
        (forall (p)
          (implies
            (member p alpha)
            (part-of p y)
        ) )
        (forall (z)
          (implies
            (part-of z y)
            (not (exists (q)
              (and
                (exists (r)
                  (and
                    (member r alpha)
                    (part-of q r)
                ) )
                (part-of q z)
  ) ) ) ) ) )) )
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
 '(forall (x alpha)
    (implies
      (and
        (member x alpha)
        (not (exists (z)
          (and
            (member z alpha)
            (not (= z x))
      ) )) )
      (sum-of x alpha)
  ) )
:name '1.21-lemma) ; proved from {1.12, 1.13} without 1.1.

(prove
 '(forall (x y)
    (implies
      (= x y)
      (part-of x y)
  ) )
:name '1.22-lemma) ; should be provable from {1.21, 1.1}. Tweak 1.1.

; Theorems 1.23-1.27 are also deducible, among others.

; [1]
; [2]
; [3]
; [4]
