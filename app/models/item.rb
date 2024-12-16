class Item < ApplicationRecord
    validates :name, presence: true
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }

    has_and_belongs_to_many :carts
    belongs_to :inventory

    def self.split_item(item, amount, cart_id)
        item_attrs = {
            name: item.name,
            brand: item.brand,
            category_id: item.category_id,
            quantity: item.quantity,
            weight: item.weight,
            price: item.price
        }
        cart_item_attrs = item_attrs
        cart_item_attrs.quantity = amount
        cart_item_attrs.cart_id = cart_id
        cart_item = Item.new(cart_item_attrs)

        inventory_item_attrs = item_attrs
        inventory_item_attrs.quantity = item_attrs.quantity - amount
        inventory_item = Item.new(inventory_item_attrs)

        if(cart_item.save && inventory_item.save)
            item.destroy
        end
    end

    def self.merge_items(item_1, item_2)
        item_1.quantity = item_1.quantity + item_2.quantity
        if item_1.update
            item_2.destroy
        end
    end
end
