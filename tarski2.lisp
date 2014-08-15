; Tarski's Axioms of Mereology, in SNARK [1].

; Taken from the English translation [2] (from the French) of [3].
; The translation is due to Joseph Henry Woodger.
; Here, Tarski is indebted to Leśniewski's Mereology [4].

(assert
;;{{{
 '(forall (X Y)
    (iff
      (proper-part-of X Y)
      (and
        (part-of X Y)
        (not (= X Y))
      )
    )
  )
;;}}}
:name 'Definition-I)

(assert
;;{{{
 '(forall (X Y)
    (iff
      (disjoint-from X Y)
      (not (exists (Z)
        (and
          (part-of Z X)
          (part-of Z Y)
        )
      ))
    )
  )
;;}}}
:name 'Definition-II)

; Maybe this requires types / sorts?
(assert
;;{{{
 '(forall (X alpha)
    (iff
      (sum-of X alpha)
      (and
        (forall (E)
          (implies
            (membership E alpha)
            (part-of E X)
          )
        )
        (not (exists (P)
          (and
            (part-of P X)
            (forall (F)
              (implies
                (membership F alpha)
                (disjoint-from P F)
              )
            )
          )
        ))
      )
    )
  )
;;}}}
:name 'Definition-III)

(assert
;;{{{
 '(forall (X Y Z)
    (implies
      (and
        (part-of X Y)
        (part-of Y Z)
      )
      (part-of X Z)
    )
  )
;;}}}
:name 'Postulate-I)

(assert
;;{{{
 '(forall (alpha)
    (implies
      (exists (E) (membership E alpha))
      (exists (X)
        (and
          (sum-of X alpha)
          (not (exists (Y)
            (and
              (sum-of Y alpha)
              (not (= X Y))
            )
          ))
        )
      )
    )
  )
;;}}}
:name 'Postulate-II)

(prove
 '(forall (X)
    (part-of X X)
  )
:name 'lemma-I)

; [1]
; [2]
; [3]
; [4]
