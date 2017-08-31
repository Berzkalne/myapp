class FutureDreamsController < ApplicationController

  before_filter :load_unicorn

  def new
    @future_dream = @unicorn.future_dreams.new
  end

  def create
    @future_dream = @unicorn.future_dreams.new(future_dream_params)
    if @future_dream.save
      redirect_to unicorn_path(@unicorn)
    else
      render 'new'
    end
  end

  def edit
    @future_dream = @unicorn.future_dreams.find(params[:id])
  end

  def update
    @future_dream = @unicorn.future_dreams.find(params[:id])
    if @future_dream.update_attributes(future_dream_params)
      redirect_to unicorn_path(@unicorn)
    else
      render 'edit'
    end
  end

  def destroy
    @future_dream = @unicorn.future_dreams.find(params[:id])
    if @future_dream.destroy
      redirect_to unicorn_path(@unicorn)
    else
      render 'new'
    end
  end

  private

  def load_unicorn
    @unicorn = Unicorn.find(params[:unicorn_id])
  end

  def future_dream_params
    params.require(:future_dream).permit(:name, :description, :unicorn_id)
  end
end
