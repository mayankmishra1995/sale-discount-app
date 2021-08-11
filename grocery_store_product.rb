class GroceryStoreProduct
  
  attr_accessor :product_name, :product_quantity, :product_price_after_discount, :product_price_before_discount
  
  def initialize(product_name, product_quantity)
    @products_details = {
      "milk" => {  
        "unit_price" => 3.97,
        "sale_unit_price" => 2.50
      },
      "bread" => { 
        "unit_price" => 2.17, 
        "sale_unit_price" => 2.0, 
      }, 
      "apple" => { 
        "unit_price" => 0.89
      },"banana" =>{ 
        "unit_price" => 0.99 
      }
    }

    @product_name = product_name
    @product_quantity = product_quantity
    @product_price_after_discount = calculate_product_price_after_discount
    @product_price_before_discount = calculate_product_price_before_discount   
  end

  def calculate_product_price_after_discount
    case @product_name
    when "milk"
      sale_on_quantity = 2
      final_milk_price = discount_calculator(@products_details[@product_name]["unit_price"], @products_details[@product_name]["sale_unit_price"],sale_on_quantity)
      return final_milk_price 
    when "bread"
      sale_on_quantity = 3
      final_bread_price = discount_calculator(@products_details[@product_name]["unit_price"], @products_details[@product_name]["sale_unit_price"],sale_on_quantity)
      return final_bread_price
    when "banana"
      return @products_details[@product_name]["unit_price"] * @product_quantity
    when "apple"
      return @products_details[@product_name]["unit_price"] * @product_quantity
    end
  end

  def calculate_product_price_before_discount
    return @products_details[@product_name]["unit_price"] * @product_quantity
  end

  def discount_calculator(product_unit_price, product_sale_unit_price, sale_on_quantity)
    product_price_after_discount = 0 
    if @product_quantity < sale_on_quantity
      product_price_after_discount = product_unit_price * @product_quantity
      return product_price_after_discount
    end
    if @product_quantity >= sale_on_quantity
      product_price_after_discount = ((product_sale_unit_price * sale_on_quantity) * (@product_quantity / sale_on_quantity) ) + (product_unit_price * (@product_quantity % sale_on_quantity))
      return product_price_after_discount
    end
  end

end