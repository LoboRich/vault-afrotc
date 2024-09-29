class HomeController < ApplicationController
  def index
    @this_month_collectibles = LoanItem.where('duedate BETWEEN ? AND ?', Date.today.beginning_of_month, Date.today.end_of_month)
    @total_collectibles = @this_month_collectibles.sum(:monthly_amort)
    @collected = @this_month_collectibles.where(is_paid: true).sum(:paid_amount)

    @this_month_water_collectibles = WaterBill.where('due_date BETWEEN ? AND ?', Date.today.beginning_of_month, Date.today.end_of_month)
    @total_water_collectibles = @this_month_water_collectibles.sum(:amount)
    @water_collected = @this_month_water_collectibles.where(status: 'paid').sum(:amount)
  end
end
