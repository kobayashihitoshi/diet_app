class FoodRecord < ApplicationRecord
  belongs_to :user

  MEAL_TYPES = [ "朝食", "昼食", "夜食", "間食" ]

  validates :recorded_on, presence: true
  validates :meal_type, presence: true, inclusion: { in: MEAL_TYPES }
  validates :menu, presence: true
  validates :calories, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
