class GraphsController < ApplicationController
  before_action :require_login

  def index
    @weight_records = current_user.weight_records.order(recorded_on: :asc)
    @dates = @weight_records.pluck(:recorded_on)
    @weights = @weight_records.pluck(:weight)
  end
end
