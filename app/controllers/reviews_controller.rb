class ReviewsController < ApplicationController
	before_action :authenticate_user!

def index
	@cars = Car.where(user_id: current_user.id)
end

def create
	if @review = current_user.reviews.create(review_params)
		@car  = @review.car
		redirect_to car_url(@car), notice: "review was successfully created."
	else
		puts "Try Something else"
		
	end
end

def destroy
	@review = Review.find(params[:id])
	if @review.destroy
		@car = Car.find(params[:car_id])
		redirect_to @car
	end
end

private
def review_params
	params.require(:review).permit!
end

end
