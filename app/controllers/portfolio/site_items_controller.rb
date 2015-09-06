require_dependency "portfolio/application_controller"

module Portfolio
  class SiteItemsController < ApplicationController
    before_action :set_item_project, only: [:show, :edit, :update, :destroy]
    before_action :set_item, except: [:show]
    before_action :set_resource_name
    before_action Portfolio.auth_action, except: [:show]

    layout 'portfolio/admin'

    def index
      # @item_projects = @item.site_items.of_type(resource.type_name)
      @item_projects = resource.where(site: @item)
    end

    def show
      @item = Site.find_by(key: params[:portfolio_key])
      render layout: 'portfolio/portfolio'
    end

    def new
      puts "*** #{resource}"
      @item_project = resource.new site: @item
    end

    def edit
      @image = SiteItemImage.new site_item: @item_project
    end

    def create
      @item_project = resource.new(item_project_params)

      if @item_project.save
        redirect_to [@item, @resource_name_p], notice: 'Item project was successfully created.'
      else
        render :new
      end
    end

    def update
      if @item_project.update(item_project_params)
        redirect_to [@item, @resource_name_p], notice: 'Item project was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @item_project.destroy
      redirect_to [@item, @resource_name_p], notice: 'Item project was successfully destroyed.'
    end

    private
      def set_item_project
        @item_project = resource.find(params[:id])
      end

      def item_project_params
        params.require(@resource_name).permit(:site_id, :title, :body, :url)
      end

      def set_item
        @item = Site.find params[:site_id]
      end

      def set_resource_name
        @resource_name = resource.name.underscore.split('/').last
        @resource_name_p = @resource_name.pluralize
      end

      def resource
        raise NotImplementedError
      end
  end
end
