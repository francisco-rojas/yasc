class OrderService
  attr_accessor :order

  delegate :user, to: :order

  def initialize(order)
    self.order = order
  end

  def place_order
    ActiveRecord::Base.transaction do
      split_orders
      clear_order
    end
  end

  private

  def split_orders
    items_by_location.each do |building, items|
      if building
        new_order = create_new_order(building, items)
        allocate_items(new_order, items)
      end
    end
  end

  def clear_order
    order.items_count = 0
    order.total_amount = 0
    order.save!
  end

  def allocate_items(new_order, items)
    items.each do |item|
      item.order = new_order
      item.save!
    end
  end

  def create_new_order(building, items)
    Order.create!(user: user,
                  building: building,
                  status: :submitted,
                  items_count: items.size,
                  total_amount: items.sum(&:total_amount))
  end

  def items_by_location
    order.items.group_by { |item| item.building }
  end
end