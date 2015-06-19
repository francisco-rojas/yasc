class PurchaseService
  attr_accessor :order, :item

  def initialize(current_order)
    self.order = current_order
  end

  def add_to_cart(data, product, quantity)
    ActiveRecord::Base.transaction do
      item_data = data.slice(:building, :floor, :room, :quantity, :extra_info)
      item_data.merge!(product: product)
      self.item = order.items.create!(item_data)
      update_total_amounts(quantity)

      order.items_count += 1
      order.save!
      item.save!
    end
  end

  def remove_from_cart(item_id)
    ActiveRecord::Base.transaction do
      self.item = order.items.find(item_id)
      update_total_amount_on_remove
      item.destroy!
      order.items_count -= 1
      order.save!
    end
  end

  private

  def update_total_amounts(quantity)
    item.cost_per_item = item.product.cost_per_item
    item.total_amount = item.cost_per_item * quantity
    order.total_amount += item.total_amount
  end

  def update_total_amount_on_remove
    order.total_amount -= item.total_amount
  end

end
