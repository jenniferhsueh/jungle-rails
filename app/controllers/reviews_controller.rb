class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    review = Review.new(review_params)
    if review.save
      session[review_id] = review.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
