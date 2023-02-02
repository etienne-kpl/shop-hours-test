class Holiday < ApplicationRecord
  belongs_to :shop
  validates :date, presence: true
  validates :start_time, presence: true, if: :end_time?
  validates :end_time,
            presence: true,
            comparison: { greater_than: :start_time },
            if: :start_time?

  validate :check_holidays

  private

  def check_holidays
    other_holidays = Holiday.where(shop_id:, date:)
    # Check if it is already set as closed
    if other_holidays.any? { |el| el.end_time.nil? && el.start_time.nil? }
      errors.add(:base, :invalid, message: 'Shop is already defined as closed for this date')
    # Check for overlapping slots
    elsif other_holidays.any? { |el| start_time <= el.end_time && end_time >= el.start_time }
      errors.add(:base, :invalid, message: 'Opening hours cannot overlap with another time slot for this holiday')
    end
  end
end
