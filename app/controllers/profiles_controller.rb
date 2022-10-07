class ProfilesController < ApplicationController
before_action :authenticate_user!
before_action :set_profile, only: %i[show edit update destroy]


def index
@profile = Profile.all
end

def new
	@profile = Profile.new
end

def create
	@profile = current_user.build_profile(profile_params)

	if @profile.save
		redirect_to profile_url(@profile), notice: "Profile was successfully created."
	else
		render :new
	end
end

def edit
end

def update
	if @profile.update(profile_params)
		redirect_to profile_url(@profile), notice: "Your Profile has updated."
	end
end

def destroy
	if @profile.destroy
		redirect_to new_profile_url
	end
end

private
def profile_params
	params.require(:profile).permit(:first_name, :last_name, :gender, :age, :street, :house_no, :city, :state, :country, :zip_code, :avatar)
end

def set_profile
	@profile = Profile.find(params[:id])
end
end
