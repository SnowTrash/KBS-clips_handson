
; https://en.wikipedia.org/wiki/Monkey_and_banana_problem
; https://es.slideshare.net/hemak15/lecture-15-monkey-banana-problem
; https://es.slideshare.net/ManjeetKamboj/monkey-banana-problem-in-ai
; https://www.tutorialspoint.com/prolog/prolog_monkey_and_banana_problem.htm
; https://people.uncw.edu/narayans/courses/csc434/monkey.pdf


;; para definir variables globales
;; (defglobal ?*alturas* = (create$ 0 2 3 5 10))
;; suelo, encima del escritorio, encima de la silla y el escritorio , brincando

;; se preasume que el changuito sabe como moverse
;; cargar cosas( silla , escritorio)
;; subirse a cosas ( encima de_)


                  ;; Definimos las plantillas;
;monkey
(deftemplate monkey
  (slot estado (default hambriento))
  (slot name (default jorge))
  (slot cargando-algo (default FALSE))
  (slot curioso (default TRUE))
  (slot encima-del (default piso))
  (slot debajo-de (default nada))
)

;banana
(deftemplate banana
  (slot sabor (default dulce))
  (multislot name)
  (slot encima-del (default todo))
  (slot debajo-de (default techo))
)

(deffunction tomar-banana (?chango ?fruta)
  (monkey (name ?chango) (cargando-algo ?flag))
  (banana (name ?fruta) (encima-del ?endel) (debajo-del ?debdel) )
  (bind ?*flag* TRUE)
  (bind ?*endel* monkey)
  (bind ?*debdel* monkey)
)

(deffunction hambre(?nombre)
 (monkey (estado ?state)(name ?nombre))
 (bind ?*state* hambriento) 
)

(deffacts changuitos
    (monkey (estado tranqilon))
    (monkey (name juan) (curioso FALSE) )
)

(defrule main-loop
    (hambre (jorge))
    (monkey name ?nombre curioso ?curios)
    (bind ?flag ?curios)
    (test (eq ?flag TRUE))
    =>
(printout t " < 15 dias entre hoy y la v" crlf)
)
