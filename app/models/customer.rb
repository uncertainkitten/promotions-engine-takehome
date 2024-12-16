class Customer < ApplicationRecord
    validates :name, presence: true

    has_one :cart
    before_create :create_remember_token

    def current_cart
        if self.cart.nil?
            self.create_cart(user_id: self.id)
        end
        self.cart
    end
end
