class UnicornsController < ApplicationController
	
	def index
		@unicorns = Unicorn.all
	end

	def show
		@unicorn = Unicorn.find(params[:id])
	end

	def new
		@unicorn = Unicorn.new
	end

	def create
		@unicorn = Unicorn.new(unicorn_params)
		if @unicorn.save
			flash[:success] = "New unicorn added!"
			redirect_to unicorn_path(@unicorn) 
		else
			flash[:error] = "Mission failed! Try again!"	
			render 'new'
		end
	end

	def edit
		@unicorn = Unicorn.find(params[:id])
	end

	def update
		@unicorn = Unicorn.find(params[:id])
		if @unicorn.update_attributes(unicorn_params)
			flash[:success] = "Information updated!"
			redirect_to unicorn_path(@unicorn)
		else
			flash[:error] = "Mission failed!"
			render 'edit'
		end
	end

	def destroy
		@unicorn = Unicorn.find(params[:id])
		if @unicorn.destroy
			flash[:success] = "Unicorn deleted!"
			redirect_to unicorn_path(unicorns)
		else
			flash[:error] = "Mission failed!"
			render 'index'
		end

	end
	
	private

	def unicorn_params
		params.require(:unicorn).permit(:first_name, :age, :horn_length, :height, :weight)
	end

end
