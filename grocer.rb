require 'pry'

def consolidate_cart(cart)
  new_cart = {}
    cart.each do |items, array|
      items.each do |veg, veg_attr|
        veg.uniq
      #  if items
        binding.pry
    #  new_cart << items
        #new_cart << array


      #if new_cart[count].nil?

    end
    end
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
