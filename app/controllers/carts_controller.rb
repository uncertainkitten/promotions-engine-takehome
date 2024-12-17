class CartsController < ApplicationController
    before_action :set_cart, only: %i[ show edit update ]
    before_action :clean_cart

    def show
        @items = @cart.items
        @total = @cart.total
    end

    def edit
    end

    def update
        @item = Item.find(params[:cart][:item_id])
        if(Integer(params[:cart][:amount]) > @item.quantity)
            flash[:notice] = "You can't have that many.  Be less greedy."
            redirect_to inventory_item_path(@item.inventory.id, @item.id)
        end
        
        updated_item = Item.split_item(@item, Integer(params[:cart][:amount]), @cart.id)
        if updated_item
            flash[:notice] = "Item added to cart!"
            clean_cart()
            redirect_to inventory_item_path(updated_item.inventory.id, updated_item.id)
        else
            flash[:notice] = "There was a problem with your request"
            redirect_to inventory_item_path(@item.inventory.id, @item.id)
        end
    end

    private
    def set_cart
        @cart = Cart.find(Current.user.cart.id)
    end

    def clean_cart
        @cart = Cart.find(Current.user.cart.id)
        Item.clean_collection(@cart)
    end
    
    def cart_params
        params.expect(cart: [:item_id, :amount])
    end
end
