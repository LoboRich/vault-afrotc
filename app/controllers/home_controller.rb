class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @vehicles = Vehicle.all
    @total_vehicles = @vehicles.count
    @registered_vehicles = @vehicles.where(is_registered: true).count
    @unregistered_vehicles = @vehicles.where(is_registered: false).count
    @expired_vehicles = @vehicles.where(status: 'Expired').count
  end

  def vehicles_by_year
    render json: Vehicle.where.not(year_model: nil).group(:year_model).count
  end
  
  def vehicles_by_status
    render json: {
      "Operating" => Vehicle.where(status: "OPERATING").count,
      "Non-Operating" => Vehicle.where.not(status: "OPERATING").count
    }
  end

  def vehicles_by_full_status
    data = Vehicle.group(:status).count
    render json: data
  end
  
end
