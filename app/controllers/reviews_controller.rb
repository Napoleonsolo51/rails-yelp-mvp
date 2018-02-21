class ReviewsController < ApplicationController

	# /restaurants/:restaurant_id/new
	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new(review_params)
		@review.restaurant = @restaurant
		@review.save

		redirect_back fallback_location: root_path
	end

	def review_params
		params.require(:review).permit(:author, :content, :stars)
	end
end

