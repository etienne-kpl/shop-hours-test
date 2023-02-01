class Holiday < ApplicationRecord
  belongs_to :shop
  validates :date, presence: true
  validates :end_time,
            presence: true,
            comparison: { greater_than: :start_time },
            if: :start_time?
end
