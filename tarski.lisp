; Tarski's Axioms of Mereology, in SNARK [1].

; Taken from the English translation [2] (from the French) of [3].
; The translation is due to Joseph Henry Woodger.
; Here, Tarski is indebted to Leśniewski's Mereology [4].

(assert
 '(forall (X Y)
    (implies
      (proper-part X Y)
      (and
        (part-of X Y)
        (not (= X Y))
      )
    )
  )
:name 'definition-I)

(assert
 '(forall (X Y)
    (implies
      (disjoint X Y)
      (not (exists (Z)
        (and
          (part-of Z X)
          (part-of Z Y)
        )  
      ))
    )
  )
:name 'definition-II)

(assert
 '(forall (X alpha)
    (implies
      (sum-of alpha X)
      (and
        (forall (Y)
          (implies
            (member Y alpha)
            (part-of Y X)
          )
        )
        (not (exists (Z)
          (and
            (part-of Z X)
            (forall (W)
              (implies
                (member W alpha)
                (disjoint Z W)
              )
            )
          )
        ))
      )
    )
  )
:name 'definition-III)

(assert
 '(forall (X Y Z)
    (implies
      (and
        (part-of X Y)
        (part-of Y Z)
      )
      (part-of X Z)
    )
  )
:name 'axiom-I)

(assert
 '(forall (alpha)
    (exists (X)
      (and
        (implies
          (exists (Y) (member Y alpha))
          (sum-of alpha X)
        )
        (not (exists (Z)
          (and
            (implies
              (exists (W) (member W alpha))
              (sum-of alpha Z)
            )
            (not (= X Z))
          )
        ))
      )
    )
  ) 
:name 'axiom-II)

(prove
 '(forall (X)
    (part-of X X)
  )
:name 'lemma-I)

; [1]
; [2]
; [3]
; [4]
