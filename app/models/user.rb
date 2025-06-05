class User < ApplicationRecord
  has_secure_password
  has_many :weight_records, dependent: :destroy
  has_many :food_records, dependent: :destroy
  has_many :exercise_records, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, :age, :gender, :current_weight, :target_weight, presence: true
end
