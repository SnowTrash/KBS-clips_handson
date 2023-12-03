;;Define a rule for finding which products have been bought AND their quantity
(defrule prods-bought
   (customer (customer-id ?id) (name ?cn))
   (order (order-number ?order))
   (line-item (order-number ?order) (part-number ?part)) (quantity ?q)
   (product (part-number ?part) (name ?pn))
   =>
   (printout t ?cn " was bought " ?q ?pn crlf))


;; 1 - No te pierdas estas ventas de la fecha (navidad,año nuevo, etcetc)
;; dobles puntos si eres miembro
(defrule upcoming-sales-notification
   (customer (customer-id ?id) (name ?cn) (phone ?phone))
   =>
   (assert (text-customer ?cn ?phone "Don't miss our upcoming sale this weekend. Great discounts await you!" crlf))
   (printout t ?cn " (" ?phone ") mensaje al cliente" crlf)
)
; [fiestas 1.1 Venta dia de muertos,
; 1.2 Venta Navidad,
; año nuevo, dia de reyes...]
(defrule sales-in-holiday
  (order (customer-id ?id) (purchase-date ?born))
  (holiday (name ?god) (dia-santo ?dia))
  (test (eq ?dia ?born))
  =>
  (printout t  ?id " celebrando "?god  crlf)
)

;; 2 - Define a rule for finding those customers who have not bought nothing at all 
(defrule cust-not-buying
     (customer (customer-id ?id) (name ?name))
     (not (order (order-number ?order) (customer-id ?id)))
   =>
   (assert (text-customer ?name "tienes 25% en tu primera compra" crlf))
   (printout t ?name " tienes 25% desc prox compra msj "crlf))

; 3 CashBack - por compra total
(defrule cust-1000-coins
   (customer (customer-id ?id) (name ?cn))
   (order (order-number ?order) (customer-id ?id))
   (line-item (order-number ?order) (part-number ?part) (quantity ?q))
   (product (part-number ?part) (name ?pn) (price ?cost))
   ;?membresia <- (card-update (points ?old_points) (total-buys ?old_buys) (cupon-buy ?old_cupon_buy))
   (test (> (* ?q ?cost) 1000))
   =>
  ; (modify ?membresia (points (+ ?old_points (* ?q ?cost .10))) (total-buys (+ ?old_buys 1)) (cupon-buy (+ ?old_cupon_buy 1)))
   (printout t"+1000dlls buought products (" (* ?q ?cost) ")" ?cn " obtienes 10% en puntos (" (* ?q ?cost .10) ")"crlf)
)

; 4 .- Define a rule for finding those customers who bought more than 5 products from one department
(defrule cust-5-prods
   (customer (customer-id ?id) (name ?cn))
   (order (order-number ?order) (customer-id ?id))
   (line-item (order-number ?order) (part-number ?part) (quantity ?q&:(> ?q 5)))
   (product (part-number ?part) (name ?pn) (category ?cat))
   =>
   (printout t ?cn " bought more than 5 (" ?pn ") from dept: (" ?cat ")" crlf)
)

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

; (defrule cantDrive
;  (driver (name ?name) (dateBorn ?born))
;  (test (< (date-years-diff (current-date) ?born) 25))
;  =>
;  (printout t ?name " is younger than 25" crlf))

; (defrule buy_15days
;   (driver (name ?name1) (dateBorn ?born1))
;   (driver (name ?name2) (dateBorn ?born2))
;   (test (< (date-days-diff ?born2 ?born1) 4))
;   =>
;   (printout t ?name1 ?born1" Menos de 5 dias daysdiff " ?name2 ?born2 crlf)
; )

;; Regla para compra en menos de 15 dias

;; FUNCIONES PARA FECHAS
;; Definimos funciones que nos ayudan a manipular fechas

(deffunction current-date ()
   (bind ?lt (local-time))
   (format nil "%04d-%02d-%02d" (nth$ 1 ?lt) (nth$ 2 ?lt) (nth$ 3 ?lt))
)

(deffunction is-leap-year (?year)
   (if (= (mod ?year 400) 0) then (return TRUE))
   (if (= (mod ?year 100) 0) then (return FALSE))
   (if (= (mod ?year 4) 0) then (return TRUE))
   (return FALSE)
)
   
(deffunction days-from-year-begin (?date)
   (bind ?year (string-to-field (sub-string 1 4 ?date)))
   (bind ?month (string-to-field (sub-string 6 7 ?date)))
   (bind ?day (string-to-field (sub-string 9 10 ?date)))
   (if (is-leap-year ?year)
      then
      (return (+ (nth$ ?month ?*days-before-month-leap-year*) ?day))
      else
      (return (+ (nth$ ?month ?*days-before-month*) ?day)))
)
      
(deffunction days-until-year-end (?date)
   (bind ?year (string-to-field (sub-string 1 4 ?date)))
   (bind ?month (string-to-field (sub-string 6 7 ?date)))
   (bind ?day (string-to-field (sub-string 9 10 ?date)))
   (if (is-leap-year ?year)
      then
      (return (- 366 (+ (nth$ ?month ?*days-before-month-leap-year*) ?day)))
      else
      (return (- 365 (+ (nth$ ?month ?*days-before-month*) ?day))))
)

(deffunction dias-de-diferencia (?date1 ?date2)
   (bind ?year1 (string-to-field (sub-string 1 4 ?date1)))
   (bind ?year2 (string-to-field (sub-string 1 4 ?date2))) 
   (if (= ?year1 ?year2)
      then
      (return (- (days-from-year-begin ?date1)(days-from-year-begin ?date2))))
   (if (> ?year1 ?year2)
      then
      (bind ?negate FALSE)
      else
      (bind ?negate TRUE)
      (bind ?temp ?date1)
      (bind ?date1 ?date2)
      (bind ?date2 ?temp)
      (bind ?temp ?year1)
      (bind ?year1 ?year2)
      (bind ?year2 ?temp))
   (bind ?day-count (+ (days-until-year-end ?date2) (days-from-year-begin ?date1)))
   (loop-for-count (?year (+ ?year2 1) (- ?year1 1)) do
      (if (is-leap-year ?year)
         then (bind ?day-count (+ ?day-count 366))
         else (bind ?day-count (+ ?day-count 365))))
   (if ?negate
      then 
      (return (- 0 ?day-count))
      else
      (return ?day-count))
)

; (defrule buy_5days
;   (order (order-number ?on) (customer-id ?ci) (purchase-date ?date))
;   (test (> (dias-de-diferencia (current-date) ?date) 7))
;   =>
;   (printout t ?ci " menos? > de 7 dias de diferencia entre hoy y -> " ?date crlf)
; )


; 5.- Oferta por frecuencia ( 15 o 30 ) dias
(defrule buy_10days
  (customer (customer-id ?ci) (name ?quien))
  (order (customer-id ?ci) (order-number ?on) (purchase-date ?date)) 
  (test (< (abs(dias-de-diferencia (current-date) ?date)) 15))
  =>
  (printout t " < 15 dias entre hoy y la venta "?quien " - id:" ?ci " - #order: "?on "  del: " ?date  crlf)
  (printout t "Tested value -> "(dias-de-diferencia (current-date) ?date) crlf)
)

(defrule buy_10mdays
  (customer (customer-id ?ci) (name ?quien))
  (order (customer-id ?ci) (order-number ?on) (purchase-date ?date)) 
  (test (> (abs(dias-de-diferencia (current-date) ?date)) 15))
  =>
  (printout t " > 15 dias entre hoy y la venta "?quien " - id:" ?ci " - #order: "?on "  del: " ?date  crlf)
  (printout t "Tested value -> "(dias-de-diferencia (current-date) ?date) crlf)
)

; 6.- Meses sin intereses basado en puntaje (6,12,18,24)
(defrule levels_credits
  (customer (customer-id ?ci) (name ?quien))
  (order (order-number ?order) (customer-id ?id) (purchase-date ?date))
  (line-item (order-number ?order) (part-number ?part) (quantity ?q))
  (product (part-number ?part) (name ?pn) (price ?cost))
  (level-update (customer-id ?ci) (level ?lvl))
  (test (> (* ?q ?cost) 1000))
  =>
  (printout t " En tu venta "?quien " - id:" ?ci " - #order: "?order "  del: " ?date " recibe (" (nth$ ?lvl ?*meses-segun-nivel*) " ) sin intereses" crlf)
)

; 7.- Oferta de cumpleaños (puntos dobles)
(defrule sales-in-holiday
  (customer (customer-id ?id) (register-date ?dia) (name ?neim))
  (order (customer-id ?id) (purchase-date ?born))
  (line-item (order-number ?order) (part-number ?part) (quantity ?q))
  (product (part-number ?part) (name ?pn) (price ?cost))
  (test (eq ?dia ?born))
  =>
  (printout t  ?id " Feliz Cumpleaños "?neim " recibe puntos dobles en tu compra : "(* ?q ?cost .20) crlf)
)

; 8.- Puntos por cada producto sobre 5 productos

; 9.- Premio por recomendar (5,15,50,100)
(defrule recomended-5-friends
   (customer (customer-id ?id) (name ?cn))
   (level-update (customer-id ?id) (refered-friends ?rf&:(> ?rf 100)))
   =>
   (printout t ?cn " recomendaste mas de 100 personas" ?cn " -> recibe un oso grande de pelushe" crlf)
)

(defrule recomended-15-friends
   (customer (customer-id ?id) (name ?cn))
   (level-update (customer-id ?id) (refered-friends ?rf&:(> ?rf 50)))
   (test (< ?rf 100) )
   =>
   (printout t ?cn " recomendaste mas de 50 personas" ?cn " -> recibe un oso chiquillo de pelushe" crlf)
)

(defrule recomended-50-friends
   (customer (customer-id ?id) (name ?cn))
   (level-update (customer-id ?id) (refered-friends ?rf&:(> ?rf 15)))
   (test (< ?rf 50) )
   =>
   (printout t ?cn " recomendaste mas de 15 personas" ?cn " -> recibe un oso llaver de pelushe" crlf)
)


;; 11 Clasificar por codigo postal

;; 12 mayorista o personal en sus compras

;; 13 relacion compras con/sin oferta