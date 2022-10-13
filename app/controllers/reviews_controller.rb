class ReviewsController < ApplicationController
	before_action :authenticate_user!
before_action :set_review, only: %i[update destroy]


def create
	if @review = Review.create(review_params)
		@car  = @review.car
		redirect_to car_url(@car), notice: "review was successfully created."
	else
		puts "Try Something else"
		
	end
end

def destroy
	if @review.destroy
		@car = Car.find(params[:car_id])
		redirect_to @car
	end
end

private
def review_params
	params.require(:review).permit!
end

def set_review
	@review = Review.find(params[:id])
end
end
