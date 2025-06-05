class FoodRecordsController < ApplicationController
  before_action :require_login
  before_action :set_food_record, only: [:edit, :update, :destroy]

  def index
    @food_records = current_user.food_records.order(recorded_on: :desc, meal_type: :asc)
  end

  def new
    @food_record = FoodRecord.new
  end

  def create
    @food_record = current_user.food_records.new(food_record_params)
    if @food_record.save
      redirect_to food_records_path, notice: "食事を記録しました"
    else
      render :new, status: :ubnprocessable_entity
    end
  end

  def edit; end

  def update
    if food_record.update(weight_record_params)
      redirect_to food_records_path, notice: '記録を更新しました'
    else
      render :edit
    end
  end

  def destroy
    food_record.destroy
    redirect_to food_records_path, notice: '記録を削除しました'
  end 

  private

  def set_food_record
    food_record = current_user.food_records.find(params[:id])
  end

  def food_record_params
    params.require(:food_record).permit(:recorded_on, :meal_type, :menu, :calories)
  end
  
end
