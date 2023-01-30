class Slot < ApplicationRecord
  belongs_to :shop

  validates :weekday,
            :start_time,
            :end_time,
            presence: true
  validates :weekday, numericality: { only_integer: true, in: 0..6 }
  validates :end_time, comparison: { greater_than: :start_time }
end
