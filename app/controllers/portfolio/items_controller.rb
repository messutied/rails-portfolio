module Portfolio
  class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_admin_user!, except: [:default]

    layout 'portfolio/admin'

    def index
      @items = Item.all
    end

    def show
      render layout: 'portfolio/portfolio'
    end

    def default
      
      @item = Item.where(default: true).first
      render :show, layout: 'portfolio/portfolio'
    end

    def new
      @item = Item.new
    end

    def edit
    end

    def create
      @item = Item.new(item_params)

      respond_to do |format|
        if @item.save
          format.html { redirect_to @item, notice: 'Pf portfolio was successfully created.' }
          format.json { render :show, status: :created, location: @item }
        else
          format.html { render :new }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @item.update(item_params)
          format.html { redirect_to @item, notice: 'Pf portfolio was successfully updated.' }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :edit }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @item.destroy
      respond_to do |format|
        format.html { redirect_to portfolio_items_url, notice: 'Pf portfolio was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_item
        @item = Item.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def item_params
        params.require(:item).permit(:key, :title, :summary, :avatar, :default, :email, :person_name)
      end
  end
end