;; 1 - No te pierdas estas ventas de la fecha (navidad,año nuevo, etcetc)
;; dobles puntos si eres miembro
(defrule upcoming-sales-notification
   (customer (customer-id ?id) (name ?cn) (phone ?phone))
   =>
   (assert (text-customer ?cn ?phone "Don't miss our upcoming sale this weekend. Great discounts await you!" crlf))
   (printout t ?cn " (" ?phone ") mensaje al cliente" crlf)
)


;; 2 - Define a rule for finding those customers who have not bought nothing at all 
(defrule cust-not-buying
     (customer (customer-id ?id) (name ?name))
     (not (order (order-number ?order) (customer-id ?id)))
   =>
   (assert (text-customer ?name "tienes 25% en tu primera compra" crlf))
   (printout t ?name " tienes 25% desc prox compra msj "))

;;Define a rule for finding which products have been bought AND their quantity
(defrule prods-bought
   (customer (customer-id ?id) (name ?cn))
   (order (order-number ?order))
   (line-item (order-number ?order) (part-number ?part)) (quantity ?q)
   (product (part-number ?part) (name ?pn))
   =>
   (printout t ?cn " was bought " ?q ?pn crlf))


;;Define a rule for finding those customers who bought more than 5 products
;; generar puntos?? cashback
(defrule cust-5-prods
   (customer (customer-id ?id) (name ?cn))
   (order (order-number ?order) (customer-id ?id))
   (line-item (order-number ?order) (part-number ?part) (quantity ?q&:(> ?q 5)))
   (product (part-number ?part) (name ?pn))
   =>
   (printout t ?cn " bought more than 5 products (" ?pn ")" crlf))


;; Integrar una regla que premie si se compra en menos de un intervalo de tiempo
;; 
;; Define a rule for rewarding customer loyalty based on their last purchase
;;(defrule loyalty-reward
;;   (customer (customer-id ?cid) (name ?name) (last-purchase-date ?last-purchase))
;;   (order (order-number ?order) (customer-id ?cid))
;;   (line-item (order-number ?order) (part-number ?part))
;;   (product (part-number ?part) (name ?pn))
;;   (test (and (>= (str-compare ?last-purchase "23-01-28") 0) ; Adjusted date format
;;              (>= (- (get-internal-real-time) (parse-time ?last-purchase "%y-%m-%d")) (* 30 24 60 60)))
;;   =>
;;   (assert (loyalty-reward ?name "Reward: 10% off your next purchase!" crlf))
;;   (printout t ?name " Reward: 10% off your next purchase!" crlf))
;;   )


;;
;; El ejercicio consiste en generar 10 reglas de negocio nuevas
;;    (aqui hay 6)

;; existe el template discount offer 
;; tambien loyality-reward, pero deben guardarse los puntos yo creo
;; Oferta de cumpleaños
;; Oferta por categoria, evaluar si las compras son muchas por cat
;; Descuento del valor total

;; descuento mediante puntos despues de cierta compra ??? loyalty_reward

;; POR ULTIMO SE PODRIA AÑADIR UNA FUNCION DE INVITAR AMIGOS
;; pero para ello deberiamos cambiar el template y los facts 

;; Funciones pre-construidas entre calendarios
;; https://github.com/mattsmi/CLIPS_Date_Functions




;; Para manipular fechas
;; https://stackoverflow.com/questions/49794285/clips-compare-2-dates
;; Se prueban las fechas
(defrule cantDrive
  (driver (name ?name) (dateBorn ?born))
  (test (< (date-years-diff (current-date) ?born) 17))
  =>
  (printout t ?name " is younger than 17" crlf))
  

;; Regla para compra en menos de 15 dias
(defrule buy_15days
  (driver (name ?name1) (dateBorn ?born1))
  (driver (name ?name2) (dateBorn ?born2))
  (test (< (date-days-diff ?born2 ?born1) 15))
  =>
  (printout t ?name1 " Menos de 15 dias entre compras " ?name2 crlf)
)

   ;; Llevan 1 anio registrados
(defrule cantDrive
  (driver (name ?name) (dateBorn ?born))
  (test (< (date-years-diff (current-date) ?born) 17))
  =>
  (printout t ?name " is younger than 17" crlf))
