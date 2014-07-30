; Woodger [1] in SNARK [2]
; Atriya Sen
; RAIR Lab, RPI

; -------------------------------------------------------------------------------------------------------------------

; Woodger's 'types'. May require ATP supporting type theory. Using SNARK's 'sorts' for now.
;(declare-sort 'individual)
;(declare-sort 'class-of-individuals)
;(declare-sorts-incompatible 'individual 'class-of-individuals)

; -------------------------------------------------------------------------------------------------------------------

; 1.1 - AXIOMS INVOLVING 'part-of'

; AXIOM
; The predicate symbol 'part of' is transitive:
; declare-relation results in problems
;(declare-predicate 'part-of 3 :sort '(boolean individual individual))
(assert
;'(forall ((x individual) (y individual) (z individual))
 '(forall (x y z)
    (implies
      (and
        (part-of x y)
        (part-of y z)
      )
      (part-of x z)
  ) )
:name '1.1.1)

; Temporary to implementing set theory (NBG?)
;(declare-relation 'member 2 :sort '(individual class-of-individuals))

; DEFINITION: The sum of a class of parts
; x is the sum of alpha if alpha is contained in the parts of x, and if when y is any part of x there is always a z belonging to alpha having parts in common with the parts of y:
; declare-function-symbol does not appear to be working as per (outdated?) documentation
;(declare-relation 'sum-of 2 :sort '(individual class-of-individuals))
(assert
;'(forall ((x individual) (y individual) (alpha class-of-individuals) (t individual))
   ;(exists ((z individual) (arb-part individual))
 '(forall (x y alpha t)
    (exists (z arb-part)
      (iff
        (sum-of x alpha)
        (and
          (implies
            (member t alpha)
            (part-of t x)
          ) ; alpha is included in the parts of x -> for all t which are members of alpha, t is a part of x
          (implies
            (part-of y x)
            (and
              (member z alpha)
              (and
                (part-of arb-part z)
                (part-of arb-part y)
  ) ) ) ) ) ) )
:name '1.1.2)

; AXIOM
; Every class which is not null (provided of course that it is of the same type as the field of parts) has a sum:
(assert
;'(forall ((alpha class-of-individuals))
   ;(exists ((arb-member individual) (sum individual))
 '(forall (alpha)
    (exists (arb-member sum)
      (implies
        (member arb-member alpha)
        (sum-of sum alpha) ; there exists a sum ('sum') of alpha
  ) ) )
:name '1.1.3)

; -------------------------------------------------------------------------------------------------------------------

; LEMMAS FROM 1.1.1-1.1.3 :-

; LEMMA (from 1.1.1-1.1.3)
; The relation 'part of' is reflexive
(prove
;'(forall ((x individual))
 '(forall (x)
    (part-of x x)
  )
:name '1.1.4)

; LEMMA (from 1.1.1-1.1.3)
; Only the logical product of 'part of' with diversity will be asymmetrical
(prove
 '(forall (x y)
    (implies
      (and
        (part-of x y)
        (not (= x y))
      )
      (not (part-of y x))
  ) )
:name '1.1.5)

; LEMMA (from 1.1.1-1.1.3)
; The logical product of 'part-of' with its converse is included in identity
(prove
 '(forall (x y)
    (implies
      (and
        (part-of x y)
        (part-of y x) 
      )
      (= x y)
  ) )
:name '1.1.6)

; LEMMA (from 1.1.1-1.1.3)
; Iff xPy then the parts of x are included in the parts of y
(prove
 '(forall (x y p)
    (iff
      (part-of x y)
      (implies
        (part-of p x)
        (part-of p y)
  ) ) )
:name '1.1.7)

; -------------------------------------------------------------------------------------------------------------------

; 1.2 - AXIOMS INVOLVING 'before-in-time'

; AXIOM
; The relation 'before in time' is asymmetrical
(assert
 '(forall (x y)
    (implies
      (before-in-time x y)
      (not (before-in-time y x))
  ) )
:name '1.2.1)

; AXIOM
; @todo
(assert
 '(forall (alpha beta x y) (exists (s1 s2 m1 m2) 
    (iff
      (and
        (and
          (sum-of s1 alpha)
          (sum-of s2 beta)
        )
        (before-in-time s1 s2)
      )
      (and
        (and
          (member m1 alpha)
          (member m2 beta)
        )
        (implies
          (and
            (member x alpha)
            (member y beta)
          )
          (before-in-time x y)
  ) ) ) ) )
:name '1.2.2)

; AXIOM
; @todo
(assert
 '(forall (x y i)
    (not (exists (p)
      (implies
        (and
          (part-of p x)
          (before-in-time y p)
        )
        (implies
          (before-in-time y i)
          (before-in-time x i)
  ) ) ) ) )
:name '1.2.3)

; AXIOM
; @todo
(assert
 '(forall (x y i)
    (not (exists (p)
      (implies
        (and
          (part-of p x)
          (before-in-time p y)
        )
        (implies
          (before-in-time i y)
          (before-in-time i x)
  ) ) ) ) )
:name '1.2.4)

; -------------------------------------------------------------------------------------------------------------------

; 1.3 - AXIOMS INVOLVING THE CLASS OF MOMENTARY THINGS

; DEFINITION
; @todo
(assert
 '(forall (u v) (exists (m) (not (exists (p)
    (iff
      (member m mom)
      (implies
        (and
          (part-of u m)
          (part-of v m)
        )
        (or
          (before-in-time u v)
          (before-in-time v u)
  ) ) ) ) ) ) )
:name '1.3.1)

; AXIOM
; Everything has momentary parts
(assert
 '(forall (x)
    (exists (p)
      (and
        (part-of p x)
        (member p mom)
  ) ) )
:name '1.3.2)

; -------------------------------------------------------------------------------------------------------------------

; 1.4 - AXIOMS INVOLVING THE CLASS OF ALL ORGANIZED ENTITIES

; -------------------------------------------------------------------------------------------------------------------
; [1] J. H. Woodger, The Axiomatic Method in Biology (1937). Cambridge, U.K.: Cambridge University Press.
; [2] http://www.ai.sri.com/~stickel/snark.html