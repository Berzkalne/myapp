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
    kinds = Kind.find(params[:cash_turnover][:kind_ids])
    @cash_turnover.kinds = kinds

    @cash_turnover.kinds.each do |id|
      cash_turnover_type = @cash_turnover.kinds.find(id).cash_turnover_type
      calculated_price = @cash_turnover.kinds.find(id).calculated_price
    @cash_turnover.set_price(cash_turnover_type, calculated_price)
    end

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

    @cash_turnover.kinds.each do |id|
      cash_turnover_type = @cash_turnover.kinds.find(id).cash_turnover_type
      calculated_price = @cash_turnover.kinds.find(id).calculated_price
    @cash_turnover.set_price(cash_turnover_type, calculated_price)
    end
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
    params.require(:cash_turnover).permit(:name, :state, :priority, :description)
  end
end
