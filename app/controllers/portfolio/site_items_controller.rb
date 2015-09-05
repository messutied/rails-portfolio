require_dependency "portfolio/application_controller"

module Portfolio
  class SiteItemsController < ApplicationController
    before_action :set_item_project, only: [:show, :edit, :update, :destroy]
    before_action :set_item, except: [:show]
    before_action Portfolio.auth_action, except: [:show]

    layout 'portfolio/admin'

    # GET /item_projects
    def index
      @item_projects = @item.site_items.all
    end

    # GET /item_projects/1
    def show
      @item = Site.find_by(key: params[:portfolio_key])
      render layout: 'portfolio/portfolio'
    end

    # GET /item_projects/new
    def new
      @item_project = SiteItem.new site: @item
    end

    # GET /item_projects/1/edit
    def edit
      @image = SiteItemImage.new site_item: @item_project
    end

    # POST /item_projects
    def create
      @item_project = SiteItem.new(item_project_params)

      if @item_project.save
        redirect_to [@item, :site_items], notice: 'Item project was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /item_projects/1
    def update
      if @item_project.update(item_project_params)
        redirect_to [@item, :site_items], notice: 'Item project was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /item_projects/1
    def destroy
      @item_project.destroy
      redirect_to [@item, :site_items], notice: 'Item project was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_item_project
        @item_project = SiteItem.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def item_project_params
        params.require(:site_item).permit(:site_id, :title, :body, :url)
      end

      def set_item
        @item = Site.find params[:site_id]
      end
  end
end
