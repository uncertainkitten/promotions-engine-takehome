class InventoriesController < ApplicationController
    before_action :set_inventory, only: %i[ show ]
    before_action :clean_inventory
    
    def show
        @current = Current.user
        @items = @inventory.items
    end

    private
    def set_inventory
        @inventory = Inventory.find(params[:id])
    end
  
    def inventory_params
        params.expect(inventory: [ :user_id ])
    end

    def check_permissions
        @current = Current.user
        unless @current.business_user && @current.id === @inventory.user_id
            redirect_to @inventory
        end
    end

    def clean_inventory
        @inventory = Inventory.find(params[:id])
        Item.clean_collection(@inventory)
    end
end
