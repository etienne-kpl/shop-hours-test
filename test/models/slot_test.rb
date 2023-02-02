require "test_helper"

class SlotTest < ActiveSupport::TestCase
  setup do
    @shop = shops(:one)
  end

  test "a slot with a shop, a start_time, an end_time and a weekday should be valid" do
    slot = Slot.new(shop: @shop, start_time: '10:00', end_time: '12:00', weekday: 5)
    assert slot.valid?
  end

  test "a slot without a shop should be invalid" do
    slot = Slot.new(start_time: '10:00', end_time: '12:00', weekday: 2)
    assert_not slot.valid?
  end

  test "a slot without a weekday should be invalid" do
    slot = Slot.new(shop: @shop, start_time: '10:00', end_time: '12:00')
    assert_not slot.valid?
  end

  test "a slot without a start_time should be invalid" do
    slot = Slot.new(shop: @shop, end_time: '12:00', weekday: 3)
    assert_not slot.valid?
  end

  test "a slot without a end_time should be invalid" do
    slot = Slot.new(shop: @shop, start_time: '12:00', weekday: 3)
    assert_not slot.valid?
  end

  test "a slot with a weekday different from 0 to 6 should be invalid" do
    slot = Slot.new(shop: @shop, start_time: '10:00', end_time: '12:00', weekday: 'sunday')
    assert_not slot.valid?
  end

  test "a slot with a end_time less than its start_time should be invalid" do
    slot = Slot.new(shop: @shop, start_time: '10:00', end_time: '09:00', weekday: 4)
    assert_not slot.valid?
  end

  test "a slot overlapping with another slot on the same day should be invalid" do
    Slot.create(shop: @shop, start_time: '10:00', end_time: '12:00', weekday: 5)
    slot = Slot.new(shop: @shop, start_time: '11:00', end_time: '13:00', weekday: 5)
    assert_not slot.valid?
  end
end
