class Slot < ApplicationRecord
  belongs_to :shop

  validates :weekday,
            :start_time,
            :end_time,
            presence: true
  validates :weekday, numericality: { only_integer: true, in: 0..6 }
  validates :end_time, comparison: { greater_than: :start_time }

  validate :check_slot_overlap

  private

  def check_slot_overlap
    other_slots = Slot.where(shop_id:, weekday:)
    is_overlapping = other_slots.any? do |other_slot|
      start_time <= other_slot.end_time && end_time >= other_slot.start_time
    end
    errors.add(:overlaps_with_other, message: 'cannot overlap with other time slot') if is_overlapping
  end
end
