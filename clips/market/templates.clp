                           ;; Definimos las plantillas;
;producto
(deftemplate product
  (slot part-number)
  (slot name)
  (slot category)
  (slot price)
)

;cliente
(deftemplate customer
  (slot customer-id)
  (multislot name)
  (multislot address)
  (slot phone)
  (slot register-date)
  (slot birth-date)
)

;membresia
(deftemplate membership
  (slot customer-id)
  (multislot name )
  (slot cp-typo (default AAAA))
)

(deftemplate level-update
  (slot customer-id)
  (slot refered-by (default null))
  (slot level (default 0))
  (slot refered-friends (default 0))
)

(deftemplate card-update
  (slot customer-id)
  (slot points (default 0))
  (slot total-buys (default 1))
  (slot cupon-buy (default 0))
)


;Orden/Ticket
(deftemplate order
  (slot order-number)
  (slot customer-id)
  (slot purchase-date)
  (slot total (default 0))
)

;Producto/fila(una orden tiene muchas filas)
(deftemplate line-item
  (slot order-number)
  (slot part-number)
  (slot customer-id)
  (slot quantity (default 1))
)

(deftemplate holiday
   (slot name)
   (slot dia-santo)
)

;; Conductores para pruebas de fecha 
(deftemplate driver
   (slot name)
   (slot dateBorn))

;; Aqui se definira la plantilla de codigo postal
;; Se espera generar una regla
(deftemplate postal-code
   (slot code)
   (slot group))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

;; Aqui comienzan las plantillas de las reglas creadas
             ;; mensaje para ofrecer descuento 
(deftemplate discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
  (slot purchase-date)
)

; Recompensa loyalty 
(deftemplate loyalty-reward
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

; Oferta de cumpleaños
(deftemplate birthday-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

; 5 .- Descuento por departamento 
(deftemplate category-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

; 7 ?? 
(deftemplate total-purchase-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

;; Promocion
(deftemplate referral-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
  (slot level)
  (slot n-recomendados)
)