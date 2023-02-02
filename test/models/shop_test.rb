require "test_helper"

class ShopTest < ActiveSupport::TestCase
  test "name returns the name of the shop" do
    shop = Shop.new(name: "Le Collectionist - Tokyo")
    assert_equal "Le Collectionist - Tokyo", shop.name
  end

  test "a shop without name should be invalid" do
    shop = Shop.new
    assert_not shop.valid?
  end
end
