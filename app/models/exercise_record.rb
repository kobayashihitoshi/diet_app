class ExerciseRecord < ApplicationRecord
  belongs_to :user

  validates :recorded_on, presence: true
  validates :activity, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :calories_burned, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
