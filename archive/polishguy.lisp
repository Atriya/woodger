(assert
 '(forall (?P ?Q)
    (if
      (and
        (ingredient P Q)
        (not (= Q P))
      )
      (not (ingredient Q P))
    )
  )
:name 'Axiom-L1)

(assert
 '(forall (?P ?Q ?R)
    (if
      (and
        (ingredient P Q)
        (ingredient Q R)
      )
      (ingredient P R)
    )
  )
:name 'Axiom-L2)

(assert
 '(forall (?P ?Q)
    (if
      (forall (?a)
        (and
          (and
            (ingredient a P)
            (ingredient a Q)
          )
          (forall (?R)
            (if
              (or
                (ingredient R P)
                (ingredient R Q)
              )
              (exists (?X)
                (and
                  (ingredient X R)
                  (ingredient X a)
                )
              )
            )
          )
        )
      )
      (= P Q)
    )
  )
:name 'Axiom-L3)

(assert
 '(forall
  )
:name 'Axiom-L4)