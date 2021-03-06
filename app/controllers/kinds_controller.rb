class KindsController < ApplicationController

  def index
    @kinds = Kind.all
  end

  def show
    @kind = Kind.find(params[:id])
  end

  def new
    @kind = Kind.new
  end

  def create
    @kind = Kind.new(kind_params)
    @kind.define_calculated_price(@kind.name, @kind.price, @kind.percent)
    if @kind.save
      redirect_to kind_path(@kind)
    else
      render 'new'
    end
  end

  def edit
    @kind = Kind.find(params[:id])
  end

  def update
    @kind = Kind.find(params[:id])
    @kind.define_calculated_price(@kind.name, @kind.price, @kind.percent)
    if @kind.update_attributes(kind_params)
      redirect_to kind_path(@kind)
    else
      render 'edit'
    end
  end

  def destroy
    @kind = Kind.find(params[:id])
    if @kind.destroy
      redirect_to kinds_path
    else
      render 'show'
    end
  end

  private

  def kind_params
    params.require(:kind).permit(:name, :price, :percent, :calculated_price, :cash_turnover_type)
  end
end
