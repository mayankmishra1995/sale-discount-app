require_relative './grocery_store_product.rb'
require 'terminal-table'

$all_prices_after_discount = []
$all_prices_before_discount = []
$product_purchase = []
$table_data = []

def products
  puts "Please enter all the items purchased separated by a comma"
  product_purchase = gets.chomp.split(',')
  
  create_product "milk", product_purchase if product_purchase.include?('milk')
  create_product "bread", product_purchase if product_purchase.include?('bread')
  create_product "banana", product_purchase if product_purchase.include?('banana')
  create_product "apple", product_purchase if product_purchase.include?('apple')  
  display_bill_table
end

def create_product product_name, product_purchase
  quantity = product_purchase.count(product_name)
  single_product = GroceryStoreProduct.new(product_name, quantity)
  $table_data << [single_product.product_name.capitalize(), single_product.product_quantity, "$#{single_product.product_price_after_discount}"]
  $all_prices_after_discount.push(single_product.product_price_after_discount)
  $all_prices_before_discount.push(single_product.product_price_before_discount)
end

def display_bill_table 
  table = Terminal::Table.new :headings => ['Item', 'Quantity', 'Price'], :rows => $table_data
  puts table
  generate_receipt
end

def generate_receipt
  amount_saved = ($all_prices_before_discount.sum - $all_prices_after_discount.sum).round(2)
  puts"\n Total price: $#{ $all_prices_after_discount.sum.round(2)} \n You saved $#{amount_saved} today."
end

# products
#milk,milk,bread,banana,bread,bread,bread,milk,apple