class LikesController < ApplicationController
	def create
		if params[:car_id]
			@car = Car.find(params[:car_id])
			@car.likes.create(user: current_user, like_type: params[:like_type])
			
			if params[:like_type] == "true"
				unlike_present
			elsif params[:like_type] == "false"
				like_present
			end
						
				redirect_to @car if @car.save
		elsif params[:review_id]
			@review = Review.find(params[:review_id])
			@car = @review[:car_id]
			@review.likes.create(user: current_user, like_type: params[:like_type])
			
			if params[:like_type] == "true"
				unlike_present
			elsif params[:like_type] == "false"
				like_present
			end
			redirect_to "http://localhost:3000/cars/#{@car}" if @review.save
		end
	end

	def destroy
		if params[:car_id]
			@car =  Car.find_by(id:params[:car_id])
			@like = Like.where(user: current_user.id).where(likeable_id: params[:car_id], like_type: params[:like_type])
			@like.destroy_all
			redirect_to @car
		else
			@review = Review.find_by(id: params[:review_id])
			@car =  @review.car
			@like = Like.where(user: current_user.id).where(likeable_id: params[:review_id], like_type: params[:like_type])
			@like.destroy_all
			@car = @review.car
			redirect_to @car
		end
	end

private
	def unlike_present
      	if params[:car_id]
      		if Like.where(user: current_user.id, likeable_id: @car.id, like_type: false).present? 
      			Like.find_by(user_id: current_user.id, likeable_type: "Car", likeable_id: @car.id, like_type: false).delete
      		end
      	elsif params[:review_id]
      		if Like.where(user: current_user.id, likeable_id: @review.id, like_type: false).present?
      			Like.find_by(user_id: current_user.id, likeable_type: "Review", likeable_id: @review.id, like_type: false).delete
      		end
      	end
    end

    def like_present
      	if params[:car_id]
      		if Like.where(user: current_user.id, likeable_id: @car.id, like_type: true).present?
      			Like.find_by(user_id: current_user.id, likeable_type: "Car", likeable_id: @car.id, like_type: true).delete
      		end
      	elsif params[:review_id]
      		if Like.where(user: current_user.id, likeable_id: @review.id, like_type: true).present?
      			Like.find_by(user_id: current_user.id, likeable_type: "Review", likeable_id: @review.id, like_type: true).delete
      		end
      	end
	end
end
