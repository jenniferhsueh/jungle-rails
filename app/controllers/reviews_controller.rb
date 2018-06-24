class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    review = Review.new(review_params)
    review.product_id = params[:product_id]
    review.user_id = session[:user_id]
    if review.save
      redirect_to :back
    else
      redirect_to :back
    end

    def destroy
      @product = Product.find(params[:product_id])
      @delete_review = @product.reviews.find(params[:id])
      @delete_review.destroy
      redirect_to product_path(@product)
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
