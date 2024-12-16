class InventoriesController < ApplicationController
    before_action :set_inventory, only: %i[ show edit update ]
    before_action :check_permissions, only: %i[ edit update ]
    
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

    def check_permissions
        @current = Current.user
        unless @current.business_user && @current.id === @inventory.user_id
            redirect_to @inventory
        end
    end
end
