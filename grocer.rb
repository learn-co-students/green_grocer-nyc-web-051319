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

 # def apply_coupons(cart, coupons)
 #     cart.hash = {}
 #      coupon_price = 0
 #        count_number = 0
 #
 # end

 # def apply_coupons(cart, coupons)
 #   coupons.each do |coupon_hash|
 #
 #     fruit_name = coupon_hash[:item]
 #     new_coupon_hash = {
 #       :price => coupon_hash[:cost],
 #       :clearance => "true",
 #       :count => coupon_hash[:num]
 #     }
 #
 #      if cart.key?(fruit_name)
 #       new_coupon_hash[:clearance] = cart[fruit_name][:clearance]
 #       if cart[fruit_name][:count]>= new_coupon_hash[:count]
 #         new_coupon_hash[:count] = (cart[fruit_name][:count]/new_coupon_hash[:count]).floor
 #         cart[fruit_name][:count] = (coupon_hash[:num])%(cart[fruit_name][:count])
 #       end
 #       cart[fruit_name + " W/COUPON"] = new_coupon_hash
 #        binding.pry
 #     end
 #     end
 #   return cart
 # end

 def apply_coupons(cart, coupons)
   coupons.each do |coupon| #iterating through the coupon for avocados
     name = coupon[:item] #setting var name equal to the string coupon[:item] -- basically coupon[for the item avocado]
     if cart[name] && cart[name][:count] >= coupon[:num] #both val must be true(&&) -- cart[name] = {:price=>3.0, :clearance=>true, :count=>0} && cart[name][:count] = 0
       #if it's greater than or equal to coupon[:num] = 2 (because the coupon only applies to 2 avocados & leaves 1 un-couponed avocado.)
       if cart["#{name} W/COUPON"] #calling the cart with interpolating name var[coupon[:item]] -- set to that = {:count=>1, :price=>5.0, :clearance=>true}
         cart["#{name} W/COUPON"][:count] += 1  #calling cart[name var which is with coupon so thats why we're calling it]
         #with the count key incrementing by 1 bc amount of items is changing  = 2
         #purp: to apply multple coupons
       else
         cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}  #else setting cart[with item+coupon] equal to hash with keys set to values
                                  #{not incrementing count and setting to 1, setting price to  coupon with cost key} (coupon = {:item=>"AVOCADO", :num=>2, :cost=>5.0})
         cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance] #else setting cart[with item+coupon] with clearance key equal to cart[name= coupon[:item]][:clearance]
       end
       cart[name][:count] -= coupon[:num]
       # cart[name =coup+:item][:count]-= subtracts submitted value from given var and reassigns var to resulting difference -- coupon[:num]
       #-- indicating that it doesn't break if there are no coupons
     end
    end
   cart
 end







def apply_clearance(cart)
  # code here
end


def checkout(cart, coupons)
  # code here
end
