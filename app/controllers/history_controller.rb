class HistoryController < ApplicationController
  before_action :authenticate_user!
  before_action :set_histories, only: [:index]
  before_action :authorize_history, only: [:index]
  def index
    @histories = policy_scope(History)
  end

  private

  def set_histories
    @histories = History.all
  end

  def authorize_history
    authorize @histories, :index?
  end 

end
