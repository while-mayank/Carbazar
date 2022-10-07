class EnquiriesController < ApplicationController
	before_action :authenticate_user!
before_action :set_enquiry, only: %i[destroy]


def index
@enquiries = Enquiry.all
end

def new
	@enquiry = Enquiry.new
end

def create

	if @enquiry = current_user.enquiries.create(enquiry_params)
		redirect_to action: "index" , notice: "enquiry was successfully created."
	end
end

private
def enquiry_params
	params.require(:enquiry).permit(:content, :number)
end

def set_enquiry
	@enquiry = Enquiry.find(params[:id])
end
end
