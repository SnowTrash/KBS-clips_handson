(deftemplate customer
  (slot customer-id)
  (multislot name)
  (multislot address)
  (slot phone)
  (slot last-purchase-date)
  (multislot email)
  (slot referral-count)
  (slot reviewed-products)
  (multislot recommended-products)
)

(deftemplate product
  (slot part-number)
  (slot name)
  (slot category)
  (slot price)
)

(deftemplate order
  (slot order-number)
  (slot customer-id)
)

(deftemplate line-item
  (slot order-number)
  (slot part-number)
  (slot customer-id)
  (slot quantity (default 1))
)

(deftemplate discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

(deftemplate loyalty-reward
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

(deftemplate birthday-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

(deftemplate repeat-customer
  (multislot customer-name)
  (multislot message)
)

(deftemplate cart-abandonment-email
  (multislot customer-name)
  (multislot customer-email)
  (multislot message)
)

(deftemplate category-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

(deftemplate total-purchase-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

(deftemplate referral-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

(deftemplate review-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)
