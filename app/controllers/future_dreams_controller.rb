class FutureDreamsController < ApplicationController

  def show
    @unicorn = Unicorn.find(params[:unicorn_id])
    @future_dream = @unicorn.future_dreams
  end

  def new
    @unicorn = Unicorn.find(params[:unicorn_id])
    @future_dream = @unicorn.future_dreams.new
  end

  def create
    @unicorn = Unicorn.find(params[:unicorn_id])
    @future_dream = @unicorn.future_dreams.new(future_dream_params)
    if @future_dream.save
      redirect_to unicorn_path(@unicorn)
    else
      render 'new'
    end
  end

  def edit
    @unicorn = Unicorn.find(params[:unicorn_id])
    @future_dream = @unicorn.future_dreams.find(params[:id])
  end

  def update
    @unicorn = Unicorn.find(params[:unicorn_id])
    @future_dream = @unicorn.future_dreams.find(params[:id])
    if @future_dream.update_attributes(future_dream_params)
      redirect_to unicorn_path(@unicorn)
    else
      render 'edit'
    end
  end

  def destroy
    @unicorn = Unicorn.find(params[:unicorn_id])
    @future_dream = @unicorn.future_dreams.find(params[:id])
    if @future_dream.destroy
      redirect_to unicorn_path(@unicorn)
    else
      render 'new'
    end
  end
  def future_dream_params
    params.require(:future_dream).permit(:name, :description, :unicorn_id)
  end
end
