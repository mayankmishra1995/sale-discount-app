require_relative './grocery_store_product.rb'
require 'terminal-table'

$all_prices_after_discount = []
$all_prices_before_discount = []
$product_purchase = []
$table_data = []

def products
  puts "Please enter all the products purchased separated by a comma"
  product_purchase = gets.chomp.split(',')
  
  create_product "milk", product_purchase if product_purchase.include?('milk')
  create_product "bread", product_purchase if product_purchase.include?('bread')
  create_product "banana", product_purchase if product_purchase.include?('banana')
  create_product "apple", product_purchase if product_purchase.include?('apple')  
end

def create_product product_name, product_purchase
  quantity = product_purchase.count(product_name)
  single_product = GroceryStoreProduct.new(product_name, quantity)
  $table_data << [single_product.product_name.capitalize(), single_product.product_quantity, "$#{single_product.product_price_after_discount}"]
  $all_prices_after_discount.push(single_product.product_price_after_discount)
  $all_prices_before_discount.push(single_product.product_price_before_discount)
end
