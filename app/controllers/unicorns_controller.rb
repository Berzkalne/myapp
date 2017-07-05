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
			redirect_to unicorn_path(@unicorn)
		else
			render 'new'
		end
	end

	def edit
		@unicorn = Unicorn.find(params[:id])
	end

	def update
		@unicorn = Unicorn.find(params[:id])
		if @unicorn.update_attributes(unicorn_params)
			redirect_to unicorn_path(@unicorn)
		else
			render 'edit'
		end
	end

	def destroy
		@unicorn = Unicorn.find(params[:id])
		@unicorn.destroy
	end
	
	private

	def unicorn_params
		params.require(:unicorn).permit(:first_name, :age, :horn_length, :height, :weight)
	end

end
