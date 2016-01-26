require_dependency "portfolio/application_controller"

module Portfolio
  class SiteItemsController < ApplicationController
    before_action :set_site
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    before_action :set_resource_name

    layout 'portfolio/portfolio'

    def index
      @items = resource.where(site: @site)
      @tag = SiteItemTag.find_by_key(params[:tag_key]) if params[:tag_key]
    end

    def show
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
        @resource_name = resource.resource_name
        @resource_name_p = @resource_name.pluralize
        @resource_name_h = resource.human_name
      end

      def resource
        raise NotImplementedError
      end
  end
end
