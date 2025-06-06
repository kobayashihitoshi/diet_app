class ExerciseRecordsController < ApplicationController
  before_action :require_login
  before_action :set_exercise_record, only: [ :edit, :update, :destroy ]

  def index
    @exercise_records = current_user.exercise_records.order(recorded_on: :desc)
  end

  def new
    @exercise_record = ExerciseRecord.new
  end

  def create
    @exercise_record = current_user.exercise_records.new(exercise_record_params)
    if @exercise_record.save
      redirect_to exercise_records_path, notice: "運動を記録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @weight_record.update(weight_record_params)
      redirect_to weight_records_path, notice: "記録を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @weight_record.destroy
    redirect_to weight_records_path, notice: "記録を削除しました"
  end

  private

  def set_weight_record
    @weight_record = current_user.weight_records.find(params[:id])
  end

  def exercise_record_params
    params.require(:exercise_record).permit(:recorded_on, :activity, :duration, :calories_burned)
  end
end
