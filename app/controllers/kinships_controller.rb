class KinshipsController < ApplicationController
	def index
		@kinships = Kinship.all
	end

	def show
		@kinship = Kinship.find(params[:id])
	end

	def new
		@kinship = Kinship.new
	end

	def create
		@kinship = Kinship.new(kinship_params)
		if @kinship.save
			redirect_to kinship_path(@kinship)
		else
			render 'new'
		end

	end

	def edit
		@kinship = Kinship.find(params[:id])
	end

	def update
		@kinship = Kinship.find(params[:id])
		if @kinship.update_attributes(kinship_params)
			redirect_to kinship_path(@kinship)
		else
			render 'edit'
		end
	end

	def destroy
		@kinship = Kinship.find(params[:id])
		@kinship.destroy
	end

	private
	def kinship_params
		params.require(:kinship).permit(:name, :color, :description)
	end
end
