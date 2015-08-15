require_dependency "portfolio/application_controller"

module Portfolio
  class ItemMenuLinksController < ApplicationController
    before_action :set_item_menu_link, only: [:show, :edit, :update, :destroy]
    before_action :set_item
    before_action Portfolio.auth_action

    layout 'portfolio/admin'

    # GET /item_menu_links
    def index
      @item_menu_links = @item.item_menu_links.all
    end

    # GET /item_menu_links/1
    def show
    end

    # GET /item_menu_links/new
    def new
      @item_menu_link = ItemMenuLink.new item: @item
    end

    # GET /item_menu_links/1/edit
    def edit
    end

    # POST /item_menu_links
    def create
      @item_menu_link = ItemMenuLink.new(item_menu_link_params)

      if @item_menu_link.save
        redirect_to item_item_menu_links_path(@item), notice: 'Item menu link was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /item_menu_links/1
    def update
      if @item_menu_link.update(item_menu_link_params)
        redirect_to item_item_menu_links_path(@item), notice: 'Item menu link was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /item_menu_links/1
    def destroy
      @item_menu_link.destroy
      redirect_to item_item_menu_links_path(@item), notice: 'Item menu link was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_item_menu_link
        @item_menu_link = ItemMenuLink.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def item_menu_link_params
        params.require(:item_menu_link).permit(:item_id, :name, :url)
      end

      def set_item
        @item = Item.find params[:item_id]
      end
  end
end
