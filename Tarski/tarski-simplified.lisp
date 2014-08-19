(assert
 '(forall (y alpha)
    (iff
      (and (sum-of y alpha) (set alpha))
      (forall (x)
        (implies
          (member x alpha)
          (part-of x y)
        )
      )
    )
  )
:name 'sum-definition)

#|
(assert
 '(forall (x alpha)
    (and
      (membership x alpha)
      (not (exists (y)
        (and
          (membership y alpha)
          (not (= x y))
        )
      ))
    )
  )
:name '2) ; rather, need something saying that alpha can take values like {x}
|#

(assert
 '(forall (x alpha)
    (implies
      (and
        (member x alpha)
        (and
          (not (exists (y)
            (and
              (member y alpha)
              (not (= x y))
            )
          ))
          (set alpha)
        )
      )
      (sum-of x alpha)
    )
  )
:name 'x-is-sum-of-x)

(prove
 '(forall (x)
    (part-of x x)
  )
:name 'goal)
