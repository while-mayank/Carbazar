class CarsController < ApplicationController
before_action :authenticate_user!
before_action :set_car, only: %i[show edit update destroy]


def index
@cars = Car.all
end

def user_cars
@cars = current_user.cars
end

def buy_cars
end

def new
	@car = Car.new
end

def create
	if @car = current_user.cars.create(car_params)
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

end