require 'pry'
def consolidate_cart(cart)
  new_hash = {}
   cart.each_with_index do |item, index|
     item.each do |item, price|
       if new_hash[item]
         new_hash[item][:count] += 1
       else
         new_hash[item] = price
         new_hash[item][:count] = 1
       end
     end
   end
   new_hash
 end


def apply_coupons(cart, coupons)
  new_hash = {}
  cart.each do |item, price|
  coupons.each do |coupon|
    if item == coupon[:item] && price[:count] >= coupon[:num]
    price[:count] =  price[:count] - coupon[:num]
    if new_hash["#{item} W/COUPON"]
       new_hash["#{item} W/COUPON"][:count] += 1
    else
      new_hash["#{item} W/COUPON"] = {:price => coupon[:cost], :clearance => price[:clearance], :count => 1}
  end
  end
  end
  new_hash[item] = price
  end
  new_hash
end
def apply_clearance(cart)
  new_hash = {}
 cart.each do |item, clearance_check|
# binding.pry
   new_hash[item] = {}
  if clearance_check[:clearance] == true
     new_hash[item][:price] = clearance_check[:price] * 4 / 5
  else
   new_hash[item][:price] = clearance_check[:price]
  end
  new_hash[item][:clearance] = clearance_check[:clearance]
  new_hash[item][:count] = clearance_check[:count]
 end
 new_hash
end

def checkout(cart, coupons)
  cart = consolidate_cart(cart)
 	cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
    cart.each do |item, info|
# binding.pry
      total += (info[:price] * info[:count]).to_f
  end
    total > 100 ? total * 0.9 : total
end
