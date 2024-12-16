class InventoriesController < ApplicationController
    before_action :set_inventory, only: %i[ show edit update ]
    def show
        @items = @inventory.items
    end

    def edit
    end

    def update
    end

    private
    def set_inventory
        @inventory = Inventory.find(params[:id])
    end
  
    def inventory_params
        params.expect(inventory: [ :user_id ])
    end
end
