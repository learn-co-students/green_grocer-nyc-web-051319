require "pry"

def consolidate_cart(cart)
  cart.each_with_object({}) do |item_hash, new_hash|
    item_hash.each do |item, info_hash|
      if new_hash[item]
        info_hash[:count] += 1
      else
        info_hash[:count] = 1
        new_hash[item] = info_hash
      end
    end
  end
end

def apply_coupons(cart, coupons)
    coupons.each do |coupon_hash|
      coupon_hash.each do |key, coupon_item|
        if cart[coupon_item] && cart[coupon_item][:count] >= coupon_hash[:num]
          if cart["#{coupon_item} W/COUPON"]
            cart["#{coupon_item} W/COUPON"][:count] += 1
          else
            cart["#{coupon_item} W/COUPON"] = {count: 1, price: coupon_hash[:cost]}
            cart["#{coupon_item} W/COUPON"][:clearance] = cart[coupon_item][:clearance]
        end
          cart[coupon_item][:count] -= coupon_hash[:num]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, info|
    if info[:clearance] == true
      clearance = info[:price] *= 0.8
      info[:price] = clearance.round(2)
    end
  end
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  clearanced_cart = apply_clearance(couponed_cart)
  cart_total = (0).to_f
  clearanced_cart.each do |item, info|
    cart_total += info[:price] * info[:count]
  end
  cart_total = cart_total * 0.9 if cart_total > 100.00
  cart_total
end
