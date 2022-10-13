class CarsController < ApplicationController
before_action :authenticate_user! , except: %i[index]
before_action :set_car, only: %i[show edit update destroy]
before_action :correct_user, only: [:edit, :update]

def index
	if params[:brand]
		@cars = Car.where(brand: params[:brand]).where.not(user_id: current_user.id)
	elsif current_user
		@cars = Car.where.not(user_id: current_user.id)
	else
		@cars = Car.all
	end
end

def user_cars
	@cars = current_user.cars
end

def new
	@car = Car.new
end

def create
	@car = current_user.cars.create(car_params)
	if @car.save
		redirect_to car_url(@car), notice: "car was successfully created."
	else
		render :new
	end
end

def edit
end

def show
end

def update
	if @car.update(car_params)
		redirect_to car_url(@car), notice: "Your car has updated."
	end
end

def destroy
	if @car.destroy
		redirect_to new_car_url
	end
end

private
def car_params
	params.require(:car).permit(:brand, :model, :price, :manufacture_year, images: [], :fuel_type => [])
end

def set_car
	@car = Car.find(params[:id])
end

def correct_user
	@car = Car.find(params[:id])
	@user = @car.user
	redirect_to root_path unless current_user == @user
end

end
