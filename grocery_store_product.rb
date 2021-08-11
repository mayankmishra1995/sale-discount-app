class GroceryStoreProduct
  
  attr_accessor :product_name, :product_quantity, :product_price
  
  def initialize(product_name, product_quantity)
    @product_name = product_name
    @product_quantity = product_quantity
    @product_price = calculate_product_price  
  end

  def calculate_product_price
    @products_details = {
      "milk" => {  
        "unit_price" => 3.97,
        "sale_unit_price" => 2.50, 
        "sale_on_quantity" => 2
      },
      "bread" => { 
        "unit_price" => 2.17, 
        "sale_unit_price" => 2.0, 
        "sale_on_quantity" => 3
      }, 
      "apple" => { 
        "unit_price" => 0.89
      },"banana" => { 
        "unit_price" => 0.99 
      }
    }

  end
end