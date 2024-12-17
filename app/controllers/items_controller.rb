class ItemsController < ApplicationController
    before_action :set_item, only: %i[ show edit update destroy ]
    before_action :check_permissions, only: %i[ new create edit update ]

    def index
        @items = Item.all
    end

    def show
        @current = Current.user
    end

    def new
        @item = Item.new
        @inventory = Inventory.find(params[:inventory_id])
        @item.inventory_id = @inventory.id
    end

    def create
        @inventory = Inventory.find(params[:inventory_id])
        @item = Item.new(item_params)
        @item.inventory_id = @inventory.id
        if @item.save
            redirect_to inventory_item_path(@inventory.id, @item.id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @item.update(item_params)
            redirect_to inventory_path(@inventory.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @item.destroy
        redirect_to inventory_path(@inventory.id)
    end
    
    private
      def set_item
        @item = Item.find(params[:id])
        @inventory = Inventory.find(params[:inventory_id])
      end
  
      def item_params
        params.expect(item: [ :name, :brand, :weight, :quantity, :price, :category_id ])
      end

      def check_permissions
        @current = Current.user
        @inventory = Inventory.find(params[:inventory_id])
        unless @current.business_user && @current.id === @inventory.user_id
            redirect_to inventory_path(@inventory.id)
        end
    end
end
