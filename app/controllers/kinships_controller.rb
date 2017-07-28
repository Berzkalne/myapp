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
      flash[:success] = I18n.t('.notifications.created')
      redirect_to kinship_path(@kinship)
    else
      flash[:error] = I18n.t('.notifications.invalid')
      render 'new'
    end
  end

  def edit
    @kinship = Kinship.find(params[:id])
  end

  def update
    @kinship = Kinship.find(params[:id])
    if @kinship.update_attributes(kinship_params)
      flash[:success] = I18n.t('.notifications.updated')
      redirect_to kinship_path(@kinship)
    else
      flash[:error] = I18n.t('.notifications.invalid')
      render 'edit'
    end
  end

  def destroy
    @kinship = Kinship.find(params[:id])
    if @kinship.destroy
      flash[:success] = I18n.t('.notifications.deleted')
      redirect_to kinships_path
    else
      flash[:error] = I18n.t('.notifications.invalid')
      render 'show'
    end
  end

  private

  def kinship_params
    params.require(:kinship).permit(:name, :colorful, :color_id, :description)
  end
end
