require 'pry'
class CashRegister
    attr_accessor :total, :discount, :last_transaction
  
  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end
  
  def add_item(item_name, price, quantity = 1)
    @items.concat([item_name] * quantity)
    @total = @total + (price * quantity)
    @last_transaction = price
  end
  
  def apply_discount
    if @discount > 0
      discount_percentage = (@discount.to_f / 100.to_f)
      @total = @total - (@total * discount_percentage)
      integer_total = @total.to_i
      return "After the discount, the total comes to $#{integer_total}."
    else
      return "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
   @total = @total - last_transaction
  end
end
