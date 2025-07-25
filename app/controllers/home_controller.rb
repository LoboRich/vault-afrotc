class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @vehicles = Vehicle.all
    @total_vehicles = @vehicles.count
    @registered_vehicles = @vehicles.where(is_registered: true).count
    @unregistered_vehicles = @vehicles.where(is_registered: false).count
    @expired_vehicles = @vehicles.where(status: 'Expired').count

    @vehicles_by_year = Vehicle.group(:year_model).order(:year_model).count
  end
  
end
