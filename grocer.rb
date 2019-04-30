require 'pry'

# def consolidate_cart(cart)
#   new_cart = {}
#     cart.each do |items, array|
#       items.each do |veg, veg_attr|
#         veg.uniq
#       #  if items
#     #  new_cart << items
#         #new_cart << array
#
#
#       #if new_cart[count].nil?
#       #  {} << count
#
#       end
#     end
#   new_cart.flatten
# end


def consolidate_cart(cart)
  new_cart = {}
  count = 0 #setting a count value bc you need to count and increment to it.
  cart.each do |element| #element is everything as a whole
    element.each do |fruit, hash| #iterate through everything individually bc fruit are the keys, and the hash of those are values
      new_cart[fruit] ||= hash #if fruit key (keys for everything) in the new_cart hasn't already been given a value set it equal to hash which is value of everything
      new_cart[fruit][:count] ||= 0 #we're adding the :count key to to the fruit keys set and giving it a value of 0 bc of the count
      new_cart[fruit][:count] += 1 #then we're incrementing that key to count with 1 plus when there are multiple items like 2 avocados
      end
    end
  return new_cart #call the new cart
end

 def apply_coupons(cart, coupons)
     cart.hash = {}
      cart.
 end


def apply_clearance(cart)
  # code here
end


def checkout(cart, coupons)
  # code here
end
