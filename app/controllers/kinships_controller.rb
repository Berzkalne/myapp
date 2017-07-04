class KinshipsController < AplicationController
	
	def index
		@kinships = Kinship.all
	end

	def show
		@kinship = Kinship.find(ID)
	end

	def new
		@kinship = Kinship.new
	end

	def create
		@kinship = Kinship.new(attribute :value, attribute :value)
		if @kinship.save
	end

	def edit
		@kinship = Kinship.find(ID)
	end

	def update
		@kinship = Kinship.find(ID)
		if @kinship.update_attributes(attribute :value)
	end

	def destroy
		@kinship = Kinship.find(ID)
		@kinship.destroy
	end
end