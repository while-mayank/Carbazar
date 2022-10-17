class InquiriesController < ApplicationController
before_action :authenticate_user!


def index
@inquiries = current_user.cars.all
end

def new
  @inquiry = Inquiry.new
end

def create

  if @inquiry = Inquiry.create(inquiry_params)
    redirect_to action: "index" , notice: "inquiry was successfully created."
  end
end

private
def inquiry_params
  params.require(:inquiry).permit(:content, :number, :car_id)
end
end
