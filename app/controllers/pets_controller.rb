class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      flash[:success] = I18n.t('pets.notifications.created')
      redirect_to pet_path(@pet)
    else
      flash[:error] = I18n.t('pets.notifications.invalid')
      render 'new'
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update_attributes(pet_params)
      flash[:success] = I18n.t('pets.notifications.updated')
      redirect_to pet_path(@pet)
    else
      flash[:error] = I18n.t('pets.notifications.invalid')
      render 'edit'
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.destroy
      flash[:success] = I18n.t('pets.notifications.deleted')
      redirect_to pets_path
    else
      flash[:error] = I18n.t('pets.notifications.invalid')
      render 'show'
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :eye_color, :favourite_food)
  end
end
