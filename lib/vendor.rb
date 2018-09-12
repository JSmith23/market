class Vendor
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(material)
    @inventory[material]
  end

  def stock(material,quantity)
    @inventory[material] += quantity
  end
end
