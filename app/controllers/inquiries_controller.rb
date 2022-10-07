class InquiriesController < ApplicationController
before_action :authenticate_user!
before_action :set_inquiry, only: %i[destroy]


def index
@inquiries = Inquiry.all
end

def new
  @inquiry = Inquiry.new
end

def create

  if @inquiry = current_user.inquiries.create(inquiry_params)
    redirect_to action: "index" , notice: "inquiry was successfully created."
  end
end

private
def inquiry_params
  params.require(:inquiry).permit(:content, :number)
end

def set_inquiry
  @inquiry = Inquiry.find(params[:id])
end
end
