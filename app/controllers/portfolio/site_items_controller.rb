require_dependency "portfolio/application_controller"

module Portfolio
  class SiteItemsController < ApplicationController
    before_action :set_site
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    before_action :set_resource_name

    def index
      @items = resource.where(site: @site)
    end

    def show
      render layout: 'portfolio/portfolio'
    end

    private
      def set_item
        @item = resource.find_by(site_id: @site.id, id: params[:id])
        @default_image = @item.default_image if @item
      end

      def set_site
        @site = Site.find_by(key: params[:portfolio_key])
      end

      def set_resource_name
        @resource_name = resource.name.underscore.split('/').last
        @resource_name_p = @resource_name.pluralize
        @resource_name_h = @resource_name.split('_').last
      end

      def resource
        raise NotImplementedError
      end
  end
end
