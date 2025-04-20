class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @total_clients = 0
    @total_inventories = 0
    @this_month_collectibles = []
    @total_collectibles = 0
    @collected = 0
    @this_month_water_collectibles = []
    @total_water_collectibles = 0
    @water_collected = 0
  end
end
