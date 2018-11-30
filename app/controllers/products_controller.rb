class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
    
  def show
    @product = Product.find_by_id(params[:id])
  end
  
  def new
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @product = @shopping_list.products.build
  end

  def edit
    @product = Products.find(params[:id])
  end
  
  def create
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @product = @shopping_list.products.create(product_params)
    
    if @product.save
      redirect_to shopping_list_path(@shopping_list)
    else
      render 'new'
    end
  end
  
  def update
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @product = Product.find(params[:id])
    
    if @product.update(product_params)
      redirect_to shopping_list_path(@shopping_list)
    else
      render 'edit'
    end
  end
  
  def destroy
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @product = Product.find(params[:id])
    
    @product.destroy
    
    redirect_to shopping_list_path(@shopping_list)
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :description, :quantity, :shopping_list_id, :price)
    end  
end
