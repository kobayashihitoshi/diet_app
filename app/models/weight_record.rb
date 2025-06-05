class WeightRecord < ApplicationRecord
  belongs_to :user

  validates :weight, presence: true
  validates :recorded_on, presence: true
  validates :recorded_on, uniqueness: { scope: :user_id, message: "はすでに記録済みです" }
end
