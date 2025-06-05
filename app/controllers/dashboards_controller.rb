class DashboardsController < ApplicationController
  before_action :require_login

  def show
    @user = current_user
  end


  def daily
    @date = params[:date]&.to_date || Date.today
    @food_records = current_user.food_records.where(recorded_on: @date)
    @exercise_records = current_user.exercise_records.where(recorded_on: @date)
    @weight_record = current_user.weight_records.where(recorded_on: @date)
  end
end
