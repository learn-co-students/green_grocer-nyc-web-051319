require 'pry'

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
   coupons.each do |coupon| #iterating through the coupon for avocados
     name = coupon[:item] #setting var name equal to the string coupon[:item] -- basically coupon[for the item avocado]
     if cart[name] && cart[name][:count] >= coupon[:num] #both val must be true(&&) -- cart[name] = {:price=>3.0, :clearance=>true, :count=>0} && cart[name][:count] = 0
       #if it's greater than or equal to coupon[:num] = 2 (because the coupon only applies to 2 avocados & leaves 1 un-couponed avocado.)
       if cart["#{name} W/COUPON"] #calling the cart with interpolating name var[coupon[:item]] -- set to that = {:count=>1, :price=>5.0, :clearance=>true}
         cart["#{name} W/COUPON"][:count] += 1  #calling cart[name var which is with coupon so thats why we're calling it]
         #with the count key incrementing by 1 bc amount of items is changing  = 2
         #purpose: to apply multple coupons
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
  cart.each do |grocery, hash| #grocery is Avocado:, cheese: / hash is the array that follows
    if hash[:clearance] #calling in the hash with clearance key directly
      new_price = hash[:price] * 0.80 #setting a var new_price = hash[calling price key] * .80
      #mult. by .80 & not .20 bc 20% of the original price is + subtract that amount from the original price
      #you can times by .80 bc 80% of the product og price is same as product's full price with a 20% discount.
      #if you wrote .20 -- it would return 20% of og price, what you want to rreturn is the price but 20% less
        hash[:price] = new_price.round(2)  #[] undefined so you have to call the price from outta the hash and then set it to what you want it to return
         #rounding the price to 2 decimal places bc it's money
        #ex) 1.2345.round(2) = 1.23
        # .round is rounding the number to the nearest decimal place
      end
    end
  cart
end

# :price
# # change :price to 50
# def method_name(hash)
#    array[]
# end


def checkout(cart, coupons) #must use whats called in arg.
   consolidated_cart = consolidate_cart(cart) #calling method with it's argument, c_c(cart), also bc we're calling it wihtin this arg.
      couponed_cart = apply_coupons(consolidated_cart, coupons) # consolidate_cart(cart) bc it's included & as a placeholder  #^ same reasoning.
        final_cart = apply_clearance(couponed_cart) #finalcart calling apply_clearance method.
          cart_total = 0
            final_cart.each do |item, properties|
                cart_total += properties[:price] * properties[:count] #mult. price with count of properties in cart
              end
                  #10% 100> #should just be cart_total bc thats what we're apply disc. to & not [:price]
                  cart_total = cart_total * 0.90 if cart_total > 100
                    cart_total
          end
