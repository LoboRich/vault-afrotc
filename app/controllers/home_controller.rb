class HomeController < ApplicationController
  def index
    @total_reservists = Reservist.count
    @active_reservists = Reservist.where(is_active: true).count
    @inactive_reservists = Reservist.where(is_active: false).count

    @monthly_data = Reservist.group_by_month(:created_at, last: 6) .count
  end
end
