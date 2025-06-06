class WeightRecordsController < ApplicationController
  before_action :require_login
  before_action :set_weight_record, only: [ :edit, :update, :destroy ]

  def index
    @weight_records = current_user.weight_records.order(recorded_on: :desc)
  end

  def new
    @weight_record = WeightRecord.new
  end

  def create
    @weight_record = current_user.weight_records.new(weight_record_params)
    if @weight_record.save
      redirect_to weight_records_path, notice: "体重を記録しました"
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

  def weight_record_params
    params.require(:weight_record).permit(:weight, :recorded_on)
  end
end
