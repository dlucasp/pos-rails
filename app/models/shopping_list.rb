class ShoppingList < ActiveRecord::Base
  has_many :products, dependent: :destroy
  validates :name, :description, presence: true

  def total
  	products.map do |product|
  	  product.subtotal	
  	end.sum
  end 
end
