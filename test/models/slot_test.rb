require "test_helper"

class SlotTest < ActiveSupport::TestCase
  test "a slot without a weekday should be invalid"
end


# validates :weekday,
# :start_time,
# :end_time,
# presence: true
# validates :weekday, numericality: { only_integer: true, in: 0..6 }
# validates :end_time, comparison: { greater_than: :start_time }

# validate :check_slot_overlap
