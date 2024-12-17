class Item < ApplicationRecord
    validates :name, presence: true
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }

    belongs_to :carts, optional: true
    belongs_to :inventory, optional: true
    has_one :category

    def self.split_item(item, amount, cart_id)
        cart_item = Item.new(item.attributes)
        inventory_item = Item.new(item.attributes)
        cart_item.id = nil
        cart_item.inventory_id = nil
        cart_item.quantity = amount
        cart_item.cart_id = cart_id

        inventory_item.id = nil
        inventory_item.quantity = item.quantity - amount

        if(cart_item.save && inventory_item.save)
            item.destroy
            return inventory_item
        else
            return false
        end
    end

    def self.merge_things(item_1, item_2)
        item_1.quantity = item_1.quantity+item_2.quantity
        if(item_1.save)
            item_2.destroy
            return item_1
        else
            item1.quantity = item_1.quantity - item_2.quantity
            puts("Something went wrong")
        end
    end

    def self.clean_collection(collection)
        items = collection.items
        dupeHash = {}
        items.each do |item|
            dupeHash[item.name] ? dupeHash[item.name].push(item) : dupeHash[item.name] = [item]
            puts(dupeHash)
            if(dupeHash[item.name].length == 2)
                merged_item = Item.merge_things(dupeHash[item.name][0], dupeHash[item.name][1])
                dupeHash[item.name] = [merged_item]
            end
        end
    end
end
