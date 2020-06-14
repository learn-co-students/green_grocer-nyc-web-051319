require "pry"

def consolidate_cart(cart)
  # code here
  counts = Hash.new(0)
  new_array = []

  cart.each do |hash|
    counts[hash] += 1
  end

  counts.each do |element, num|
      element.each do |key, val|
        val[:count] = num
        new_array << {key => val}
      end
  end

  return_hash = Hash.new(0)

  new_array.each do |element|
    element.each do |key, val|
      return_hash[key] = val
    end
  end

  return_hash
end

consolidate_cart([
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"KALE"    => {:price => 3.0, :clearance => false}}
])

def apply_coupons(cart, coupons)
  # code here
  result = {}

  cart.each do |item, info|
    coupons.each do |coupon|
    if item == coupon[:item] && info[:count] >= coupon[:num]
      info[:count] = info[:count] - coupon[:num]
      if result["#{item} W/COUPON"]
        result["#{item} W/COUPON"][:count] += 1
      else
        result["#{item} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
      end
    end
   end
   result[item] = info
  end
  result
end


def apply_clearance(cart)
  # code here
  new_cart = {}

  cart.each do |item, info|
    if info[:clearance] == true
      info[:price] = (info[:price] * 0.8).round(2)
    end
    new_cart[item] = info
  end

  new_cart
end

apply_clearance({
  "PEANUTBUTTER" => {:price => 3.00, :clearance => true,  :count => 2},
  "KALE"         => {:price => 3.00, :clearance => false, :count => 3},
  "SOY MILK"     => {:price => 4.50, :clearance => true,  :count => 1}
})

def checkout(cart, coupons)
  # code here
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart,coupons)
  cart = apply_clearance(cart)
  result = 0
  cart.each do |food, info|
    result += (info[:price] * info[:count]).to_f
  end
  result > 100 ? result * 0.9 : result

end
