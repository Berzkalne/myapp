class UnicornsController < ApplicationController
  
  def index
    @unicorns = Unicorn.all

    respond_to do |format|
      format.html
      format.json { render json: @unicorns }
    end
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
      flash[:success] = I18n.t('unicorns.notifications.created')
      redirect_to unicorn_path(@unicorn) 
    else
      flash[:error] = I18n.t('unicorns.notifications.invalid')  
      render 'new'
    end
  end

  def edit
    @unicorn = Unicorn.find(params[:id])
  end

  def update
    @unicorn = Unicorn.find(params[:id])
    if @unicorn.update_attributes(unicorn_params)
      flash[:success] = I18n.t('unicorns.notifications.updated')
      redirect_to unicorn_path(@unicorn)
    else
      flash[:error] = I18n.t('unicorns.notifications.invalid')
      render 'edit'
    end
  end

  def destroy
    @unicorn = Unicorn.find(params[:id])
    if @unicorn.destroy
      flash[:success] = I18n.t('unicorns.notifications.deleted')
      redirect_to unicorns_path
    else
      flash[:error] = I18n.t('unicorns.notifications.invalid')
      render 'show'
    end
  end
  
  private

  def unicorn_params
    params.require(:unicorn).permit(:first_name, :age, :horn_length, :height, :weight, :kinship_id)
  end
end
