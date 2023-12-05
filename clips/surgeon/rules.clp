; estas primeras reglas deberian ser, consentimiento y revisar que no corre peligro el paciente
; -1?xd
; si - paciente_ingresado => Prepararlo para la cirugia
(defrule preparar-paciente
  ?x <- (paciente (ID-paciente ?idpa) (pulso ?pu&:(> ?pu 85)) (nombre ?name))
  =>
  (modify ?x (estado "estable"))
)
; Accion 0
; se toman las intervenciones definidas en facts(con el estado definido como genesis/creación), probaremos con una sola
(defrule generar-intervencion
  ?x <- (intervencion (ID-intervencion ?idi) (ID-paciente ?idp) (ID-cirugia ?idc) (abordaje ?lines)(estado-actual ?st) )
  (paciente (ID-paciente ?idp) (nombre ?name) (estado ~"malito"|"critico"))
  (cirugia (ID-cirugia ?idc) (nombre-procedimiento ?np))
  (test (eq "genesis" ?st))
  =>
  (modify ?x (estado-actual "anestesia"))
  (assert (acciones (ID-intervencion ?idi) (ID-agente-A ?idp) (ID-agente-B "Hospital") (numero-accion 0) (descripcion "Se asignaran medicos a :" ?name " -> para su proxima " ?np crlf) ))
  (printout t " isertando proceso 0... " ?st  crlf)
)

; Primera accion
(defrule lavarlos-all
  (acciones (ID-intervencion ?idi) (numero-accion ?an&:(eq ?an 0)))
  ?x <-(intervencion (ID-intervencion ?idi)(ID-cirugia ?idc)(ID-paciente ?idp)(ID-cirujano-principal ?idcp)(ID-cirujano-auxiliar ?idcx)(ID-enfermero-circulante ?idenc)(ID-enfermera-instrumentista ?ideni)(ID-anestesista ?idan)(abordaje ?abord) (estado-actual ?st))
  ?a <- (medico (ID-medico ?idcp))
  ?b <- (medico (ID-medico ?idcx))
  ?c <- (medico (ID-medico ?idenc))
  ?d <- (medico (ID-medico ?ideni))
  ?e <- (medico (ID-medico ?idan))
  =>
  (modify ?x (abordaje "pre-seleccionando-abordaje"))
  (modify ?a (contaminado 0)(mano-izq "guantes") (mano-der "guantes"))
  (modify ?b (contaminado 0)(mano-izq "guantes") (mano-der "guantes"))
  (modify ?c (contaminado 0)(mano-izq "guantes") (mano-der "guantes"))
  (modify ?d (contaminado 0)(mano-izq "guantes") (mano-der "guantes"))
  (modify ?e (contaminado 0)(mano-izq "guantes") (mano-der "guantes"))
  (assert (acciones (ID-intervencion ?idi) (ID-agente-A ?idp) (ID-agente-B "Medicos") (numero-accion (+ ?an 1)) (descripcion "todos los involucrados se limpian") ))
)
; Para lograr una seleccion de abordaje se debe crear una regla que modifique los
; abordajes dependiendo algo?
; se creara otra relacion entre abordajes y estados


; ingresar al quirofano.
; Segunda acción

; Anestesiarlo segun el área previamente acordada
    ;(TODO para reglas mas especificas leer los manuales y agregarlas)
(defrule anestesiar-mayor
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "mayor" ?ty))
  =>
  (printout t " a dormir como caballo trastabillado -> " ?ar  crlf)
)

(defrule anestesiar-mayor-ambulatoria
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "mayor ambulatoria" ?ty))
  =>
  (printout t " una cobacha leve -> " ?ar  crlf)
)

(defrule anestesiar-menor
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "menor" ?ty))
  =>
  (printout t " dormidillo y anestesia local -> " ?ar  crlf)
)

(defrule anestesiar-menor-ambulatoria
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "menor ambulatoria" ?ty))
  =>
  (printout t " Friega con hielo en ---> " ?ar  crlf)
)

; En el caso de la fractura de femur mediante el primer abordaje.
; la extremidad inferior izquierda de un paciente antes de la reducción abierta y
; fijación interna de una fractura de la meseta tibial. La extremidad inferior se ha colocado sobre un paño estéril y se ha
; dibujado una incisión anterolateral centrada en el tubérculo
; de Gerdy. También se ha dibujado el tendón rotuliano, la
; tuberosidad anterior de la tibia y la cabeza del peroné. Se
; ha colocado un triángulo radiotransparente bajo la rodilla
; para facilitar el acceso a la fractura y relajar los ligamentos
; laterales externo e interno

(defrule marcar-area-L
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "L" ?ar))
  =>
  (printout t " Se marca la pata con forma de S, homie  -> (Leg) = " ?ar  crlf)
)

(defrule marcar-area-V
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "V" ?ar))
  =>
  (printout t " Se marca acceso a ciertos organos  -> (Vientre) = " ?ar  crlf)
)

; Incisiones
; Arreglada (acomodar los huesos parejones)
; Suturas

;; En el caso de la Hernia se seguirá otro tipo de marcado, por lo que quizá deba generalizar ese paso




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Funciones;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; EJEMPLO EJEMPLO EJEMPLO EJEMPLO EJEMPLO EJEMPLO EJEMPLO EJEMPLO EJEMPLO
; (defrule rule-1                                                  EJEMPLO
;    ?s <- (student (grade A|B) (name ?n) (graduated ~yes))        EJEMPLO
;    =>                                                            EJEMPLO
;    (modify ?s (graduated yes))                                   EJEMPLO
;    (printout t "Congratulations " ?n "!" crlf))                  EJEMPLO
;; EJEMPLO EJEMPLO EJEMPLO EJEMPLO EJEMPLO EJEMPLO EJEMPLO EJEMPLO EJEMPLO

; NO - paciente_NEGADO => estabilizarlo y reprogramar la cirugia
(defrule devolver-paciente
  ?x <- (paciente (ID-paciente ?idpa) (pulso ?pu&:(< ?pu 85)) (nombre ?name) (estado ~"malito"))
  =>
  (modify ?x (estado "malito"))
  (printout t  ?idpa ?name " pacientes con pulso menor a 85 , cancelar la cirugia "  crlf)
)

;como puedo imprimir solo los asserts hechos de un paciente especifico?
