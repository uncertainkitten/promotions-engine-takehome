class ItemsController < ApplicationController
    before_action :set_item, only: %i[ show edit update destroy ]

    def index
        @items = Item.all
    end

    def show
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        @item.inventory_id = @inventory.id
        if @item.save
            redirect_to @item
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @item.update(item_params)
            redirect_to @item
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @item.destroy
        redirect_to items_path
    end
    
    private
      def set_item
        @item = Item.find(params[:id])
        @inventory = Inventory.find(params[:inventory_id])
      end
  
      def item_params
        params.expect(item: [ :name, :brand, :weight, :quantity, :price ])
      end
end
