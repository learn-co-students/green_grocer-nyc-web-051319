require 'pry'
def consolidate_cart(cart)
  # code here
  counter = 0
  cart.each_with_object(new_cart = {}) do |item|
    item.each do |product, info|
      new_cart[product] ||= info
      counter = cart.count(item)
      new_cart[product][:count] = counter
    end
  end
end

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|
    item_name = coupon[:item]
    if cart[item_name] && cart[item_name][:count] >= coupon[:num]
      if cart["#{item_name} W/COUPON"]
        cart["#{item_name} W/COUPON"][:count] += 1
      else
        cart["#{item_name} W/COUPON"] = {:price => coupon[:cost], :clearance => cart[item_name][:clearance] , :count => 1}
      end
      cart[item_name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
  cart.each do |item, info|
    if info[:clearance] == true
      new_price = info[:price] * 0.8
      info[:price] = new_price.round(1)
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
  total_cost = 0
  consolidated_cart = consolidate_cart(cart)
  coupons_applied = apply_coupons(consolidated_cart, coupons)
  clearance_applied = apply_clearance(coupons_applied)
  clearance_applied.each do |item, info|
    total_cost += info[:price] * info[:count]
  end
  if total_cost > 100
    total_cost *= 0.9
  end
  total_cost
end
