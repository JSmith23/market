class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(produce)
    arr = []
    @vendors.each do |vendor|
      if vendor.inventory.has_key?(produce)
        arr << vendor
      end
    end
    arr
  end

  def sorted_item_list
    arr = []
    @vendors.each do |vendor|
      vendor.inventory.sort_by do |k,v|
        arr << k
      end
    end
    arr.uniq.sort
  end

  def total_inventory
    arr = Hash.new(0)
    @vendors.each do |vendor|
      arr[vendor.inventory] += vendor.inventory[item]
    end
    arr
  end
end
