;; Instrucciones basicas para ejecuciones
;; 1st  type the following function in Jess command prompt for loading data templates 
(load load-templates.clp)
;; 2nd  type the following function in Jess command prompt for loading facts into Jess Working Memory  
(load load-facts.clp)
;; 3rd  type the following function in Jess command prompt for loading rules ...   
(load load-rules.clp)
;; 4th  type the following function in Jess command prompt for displaying current stored facts 
;; in Jess working mem...  

;;CLIPS> (load run.clp)
;;CLIPS> (reset)
;;CLIPS> (run)


;;; Instrucciones para este archivo especifico branch Hands_ON_3

    ;; Para usar fechas debemos definir los siguientes hechos globales

;; (defglobal ?*days-before-month* =           (create$ 0 31 59 90 120 151 181 212 243 273 304 334))
;; (defglobal ?*days-before-month-leap-year* = (create$ 0 31 60 91 121 152 182 213 244 274 305 335))

    
    ;; para usar los meses sin intereses
;; (defglobal ?*meses-segun-nivel* = (create$ 48 24 18 12 6))

    ; y despues cargamos los archivos

;; (load ../KBS-clips_handson/clips/market/templates.clp)
;; (load ../KBS-clips_handson/clips/market/facts.clp)
;; (load ../KBS-clips_handson/clips/market/rules.clp)


;   Podriamos aplicar modify al hecho del membership
;       y actualizarla con la regla para
;       actualizar la membresia


;; Las reglas corresponden a los diversos momentos de la campaña 

        ;;Atraer nuevos clientes
;; Difusión/Exposición 
    ; 1.- Descuentos y regalos por fecha especial - aniversario
    ; 2.- Primera compra con descuento

        ;;Retener e incentivar la compra
;; Fidelización 
    ; 3.- CashBack - por compra total
    ; 4.- Oferta por departamento (category/n)
    ; 5.- Oferta por frecuencia ( 15 o 30 ) dias
    ; 6.- Meses sin intereses basado en puntaje (6,12,18,24)
    ; 7.- Oferta de cumpleaños (puntos dobles)
    ; 8.- Puntos por cada producto sobre 5 productos

        ;;Publicitar a traves del cliente
;; Promoción
    ; 9.- Premio por recomendar (5,15,50,100)
        ; 9.1- Premio por compartir en redes 
    ; 10.- Premio por membresias (3,6,12,50)

        ;; Clasificar los clientes
;; Segmentación
    ; 11.- Codigo postal 
    ; 12.- Mayorista,Personal
    ; 13.- Compras con oferta-cupon(25%,50%,75%)


;;;;;;;;;;; DEFINIENDO CLIENTES Y REGLAS TRIGERED
; ("Joe")     ------- 
; ("Mary")    ------- 
; ("Bob")     ------- 
; ("Alice")   ------- 
; ("David")   ------- 
; ("Carol")   -------
; ("Eve")     -------
; ("Frank")   -------
; ("Grace")   -------
; ("Harry")   -------
; ("Ivy")     -------
; ("Jack")    -------
; ("Kate")    -------
; ("Liam")    -------
; ("Mia")     -------
; ("Noah")    -------
; ("Olivia")  -------
; ("Parker")  -------
; ("Quinn")   -------
; ("Riley")   -------