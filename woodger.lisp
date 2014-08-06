; Woodger [1] in SNARK [2]
; Atriya Sen
; RAIR Lab, RPI

;(declare-sort 'individual)
;(declare-sort 'class-of-individuals)
;(declare-sorts-incompatible 'individual 'class-of-individuals)

;(declare-predicate 'P 3 :sort '(boolean individual individual))
(assert
 '(forall (x y z)
    (implies
      (and
        (P x y)
        (P y z)
      )
      (P x z)
  ) )
:name '1.1.1-axiom)

;(declare-relation 'sum-of 2 :sort '(individual class-of-individuals))
(assert
 '(forall (x alpha)
    (implies
      (sum-of x alpha)
      (and
        (forall (m) 
          (implies
            (member m alpha)
            (P m x)
        ) )
        (forall (y)
          (implies
            (P y x)
            (exists (z)
              (and
                (member z alpha)
                (exists (p)
                  (and
                    (P p y)
                    (P p z)
  ) ) ) ) ) ) ) ) )              
:name '1.1.2-definition)

(assert
 '(forall (alpha)
    (exists (arb-member)
      (implies
        (member arb-member alpha)
        (exists (sum) (sum-of sum alpha))
  ) ) )
:name '1.1.3-axiom)

(prove
 '(forall (x)
    (P x x)
  )
:name '1.1.4-lemma)

(prove
 '(forall (x y)
    (implies
      (and
        (P x y)
        (not (= x y))
      )
      (not (P y x))
  ) )
:name '1.1.5-lemma)

(prove
 '(forall (x y)
    (implies
      (and
        (P x y)
        (P y x) 
      )
      (= x y)
  ) )
:name '1.1.6-lemma)

(prove
 '(forall (x y p)
    (iff
      (P x y)
      (implies
        (P p x)
        (P p y)
  ) ) )
:name '1.1.7-lemma)

(assert
 '(forall (x y)
    (implies
      (T x y)
      (not (T y x))
  ) )
:name '1.2.1-axiom)

(assert
 '(forall (alpha beta x y) (exists (s1 s2 m1 m2) 
    (iff
      (and
        (and
          (sum-of s1 alpha)
          (sum-of s2 beta)
        )
        (T s1 s2)
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
          (T x y)
  ) ) ) ) )
:name '1.2.2-axiom)

(assert
 '(forall (x y i)
    (not (exists (p)
      (implies
        (and
          (P p x)
          (T y p)
        )
        (implies
          (T y i)
          (T x i)
  ) ) ) ) )
:name '1.2.3-axiom)

(assert
 '(forall (x y i)
    (not (exists (p)
      (implies
        (and
          (P p x)
          (T p y)
        )
        (implies
          (T i y)
          (T i x)
  ) ) ) ) )
:name '1.2.4-axiom)

(assert
 '(forall (u v) (exists (m) (not (exists (p)
    (iff
      (member m mom)
      (implies
        (and
          (P u m)
          (P v m)
        )
        (or
          (T u v)
          (T v u)
  ) ) ) ) ) ) )
:name '1.3.1-definition)

(assert
 '(forall (x)
    (exists (p)
      (and
        (P p x)
        (member p mom)
  ) ) )
:name '1.3.2-axiom)

; [1] J. H. Woodger, The Axiomatic Method in Biology (1937). Cambridge, U.K.: Cambridge University Press.
; [2] http://www.ai.sri.com/~stickel/snark.html