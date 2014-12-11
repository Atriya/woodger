; Woodger From Scratch

; Sorts
(declare-sort 'individual)
(declare-sort 'class)
(declare-sorts-incompatible 'individual 'class)

; 0.1-0.7 are built into SNARK.

; Classes

; Membership
;(declare-function 'member 2 :sort '(boolean individual class))
 
; Inclusion
;(declare-function 'includes 2 :sort '(boolean class class))
(assert
 '(forall ((?alpha :sort class) (?beta :sort class))
    (iff
      (class-includes ?beta ?alpha)
      (forall ((?x :sort individual))
        (implies
          (member ?x ?alpha)
          (member ?x ?beta)
        )
      )
    )
  )
:name '0.8-definition)

; Identity

; ...

; Relations

; Inclusion
; Cannot be represented in FOL?

; Will Woodger From Scratch be archived as a failure? :(
