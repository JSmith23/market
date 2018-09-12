require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VendorTest < MiniTest::Test
  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  def test_inventory_starts_empty
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal Hash.new(0), vendor.inventory
  end

  def test_check_stock_of_inventory_returns_0_if_not_in_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_stocks_items_into_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 30, vendor.stock("Peaches", 30)
    assert_equal 55, vendor.stock("Peaches", 25)
    assert_equal 12, vendor.stock("Tomatoes", 12)
  end

  def test_inventory_returns_stocked_items
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    vendor.stock("Tomatoes", 12)
    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal expected, vendor.inventory
  end
end
