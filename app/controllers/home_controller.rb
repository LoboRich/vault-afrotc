class HomeController < ApplicationController
  def index
    @total_reservists = Reservist.count
    @active_reservists = Reservist.where(is_active: true).count
    @inactive_reservists = Reservist.where(is_active: false).count
    @monthly_data = Reservist.group_by_month(:created_at, last: 6) .count

    # linegraph data for events
    @years = Event.pluck(Arel.sql("DISTINCT EXTRACT(YEAR FROM event_date)"))
                .map(&:to_i)
                .sort
                .reverse
    selected_year = params[:year].presence || Date.current.year
    @selected_year = selected_year.to_i
    @yearly_data = Event
                    .where("EXTRACT(YEAR FROM event_date) = ?", @selected_year)
                    .group_by_month(:event_date)
                    .count
  end
end
