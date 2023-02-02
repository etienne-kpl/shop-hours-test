require "test_helper"

class HolidayTest < ActiveSupport::TestCase
  setup do
    @shop = shops(:one)
  end

  test 'a holiday without a shop should be invalid' do
    holiday = Holiday.new(date: '2023-03-05')
    assert_not holiday.valid?
  end

  test 'a holiday without a date should be invalid' do
    holiday = Holiday.new(shop: @shop)
    assert_not holiday.valid?
  end

  test 'a holiday with a date and shop should be valid' do
    holiday = Holiday.new(shop: @shop, date: '2023-03-05')
    assert holiday.valid?
  end

  test 'a holiday with a start_time but without an end_time should be invalid' do
    holiday = Holiday.new(shop: @shop, date: '2023-03-05', start_time: '10:00')
    assert holiday.invalid?
  end

  test 'a holiday with an end_time but without a start_time should be invalid' do
    holiday = Holiday.new(shop: @shop, date: '2023-03-05', end_time: '10:00')
    assert holiday.invalid?
  end

  test 'a holiday with a start_time greater than its end_time should be invalid' do
    holiday = Holiday.new(shop: @shop, date: '2023-03-05', start_time: '12:00', end_time: '10:00')
    assert holiday.invalid?
  end

  test 'a holiday with a start_time less than its end_time should be valid' do
    holiday = Holiday.new(shop: @shop, date: '2023-03-05', start_time: '10:00', end_time: '15:00')
    assert holiday.valid?
  end

  # If the shop is already set as closed
  test 'a new holiday with start_time and end_time defined on an existing holiday without them should be invalid' do
    Holiday.create(shop: @shop, date: '2023-03-05')
    holiday = Holiday.new(shop: @shop, date: '2023-03-05', start_time: '10:00', end_time: '15:00')
    assert holiday.invalid?
  end

  test 'a holiday overlapping with an existing holiday should be invalid' do
    Holiday.create(shop: @shop, date: '2023-03-05', start_time: '10:00', end_time: '15:00')
    holiday = Holiday.new(shop: @shop, date: '2023-03-05', start_time: '09:00', end_time: '10:00')
    assert holiday.invalid?
  end
end
