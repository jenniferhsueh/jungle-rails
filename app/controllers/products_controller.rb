class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end
  
  def show
    @product = Product.find params[:id]
    @product.reviews.order(created_at: :asc)
  end

end
