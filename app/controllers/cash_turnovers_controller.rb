class CashTurnoversController < ApplicationController

  def index
    @cash_turnovers = CashTurnover.all
  end 

  def show
    @cash_turnover = CashTurnover.find(params[:id])
  end

  def new
    @cash_turnover = CashTurnover.new
  end

  def create
    @cash_turnover = CashTurnover.new(cash_turnover_params)
    name = @cash_turnover.kind.name
    price = @cash_turnover.kind.price
    percent = @cash_turnover.kind.percent
    @cash_turnover.set_price(name, price, percent)
    if @cash_turnover.save
      redirect_to cash_turnover_path(@cash_turnover)
    else
      render 'new'
    end
  end

  def edit
    @cash_turnover = CashTurnover.find(params[:id])
  end

  def update
    @cash_turnover = CashTurnover.find(params[:id])
    if @cash_turnover.update_attributes(cash_turnover_params)
      redirect_to cash_turnover_path(@cash_turnover)
    else
      render 'edit'
    end
  end

  def destroy
    @cash_turnover = CashTurnover.find(params[:id])
    if @cash_turnover.destroy
      redirect_to cash_turnovers_path
    else 
      render 'show'
    end
  end

  private
  
  def cash_turnover_params
    params.require(:cash_turnover).permit(:name, :state, :kind_id, :priority, :description)
  end
end