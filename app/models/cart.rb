class Cart < ApplicationRecord
    belongs_to :user
    has_many :items

    def total
        items = self.items
        item_prices = []
        items.each do |item|
            item_prices.push(item.quantity * item.price)
        end
        return item_prices.sum()
    end
end
