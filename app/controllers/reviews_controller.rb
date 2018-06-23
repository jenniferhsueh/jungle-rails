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
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
