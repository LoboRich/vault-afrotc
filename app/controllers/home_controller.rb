class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservists = Reservist.all
    @total_reservists = @reservists.count
    @active_count   = @reservists.where(is_active: true).count
    @inactive_count = @reservists.where(is_active: false).count + @reservists.where(is_active: nil).count
    # linegraph data for events
    @events = Event.all
    @total_events = @events.count
    @total_trainings = @events.where(event_type: "training").count
    @years = @events.pluck(Arel.sql("DISTINCT EXTRACT(YEAR FROM event_date)"))
                .map(&:to_i)
                .sort
                .reverse
    selected_year = params[:year].presence || Date.current.year
    @selected_year = selected_year.to_i
    @yearly_data = Event
                    .where("EXTRACT(YEAR FROM event_date) = ?", @selected_year)
                    .group_by_month(:event_date)
                    .count

    # bargraph data for announcements
    @years = Announcemnt.pluck(Arel.sql("DISTINCT EXTRACT(YEAR FROM created_at)")).map(&:to_i).sort.reverse

    @selected_year  = params[:year].presence || Date.current.year
    @selected_month = params[:month]

    announcements = Announcemnt.all

    if @selected_year.present?
      announcements = announcements.where("EXTRACT(YEAR FROM created_at) = ?", @selected_year.to_i)
    end

    if @selected_month.present?
      announcements = announcements.where("EXTRACT(MONTH FROM created_at) = ?", @selected_month.to_i)
    end

    @announcement_data = announcements.group_by_month(:created_at, format: "%b").count
  end
end