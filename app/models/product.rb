class Product < ActiveRecord::Base
  belongs_to :shopping_list
  validates :name, :description, :quantity, :price, presence: true

  def subtotal
  	return quantity * price
  end 
end
