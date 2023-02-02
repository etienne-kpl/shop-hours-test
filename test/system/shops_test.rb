require "application_system_test_case"

class ShopsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    assert_selector "h1", text: "Nos magasins"
  end

  test "displays as much shops in index as there are in DB" do
    visit root_url
    assert_selector "li", count: Shop.count
  end
end
