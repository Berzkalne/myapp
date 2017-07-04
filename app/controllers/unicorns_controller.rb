class UnicornsController < AplicationController
	
	def index
		@unicorns = Unicorn.all
	end

	def show
		@unicorn = Unicorn.find(ID)
	end

	def new
		@unicorn = Unicorn.new
	end

	def create
		@unicorn = Unicorn.new(attribute :value, attribute :value)
		if @unicorn.save
	end

	def edit
		@unicorn = Unicorn.find(ID)
	end

	def update
		@unicorn = Unicorn.find(ID)
		if @unicorn.update_attributes(attribute :value)
	end

	def destroy
		@unicorn = Unicorn.find(ID)
		@unicorn.destroy
	end
end
