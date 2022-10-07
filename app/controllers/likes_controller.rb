class LikesController < ApplicationController
	def create
		if params[:car_id]
			@car = Car.find(params[:car_id])
			@car.likes.create
			if @car.save
				redirect_to @car
			end
		else
			@review = Review.find(params[:review_id])
			@car = @review[:car_id]
			@review.likes.create
			if @review.save
				redirect_to "http://localhost:3000/cars/#{@car}"
			end
		end
	end

	def destroy
		if params[:car_id]
			@car = Car.find_by(id: params[:car_id])
			@like = @car.likes.find_by(params[:id])
			@like.destroy
			redirect_to @car
		else
			@review = Review.find_by(id: params[:review_id])
			@like = @review.likes.find_by(params[:id])
			@like.destroy
			@car = @review.car
			redirect_to @car
		end

	end

end
