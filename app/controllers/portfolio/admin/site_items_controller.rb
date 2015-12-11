module Portfolio
  module Admin
    class SiteItemsController < ApplicationController
      before_action :set_item, only: [:show, :edit, :update, :destroy]
      before_action :set_site, except: [:show]
      before_action :set_resource_name
      before_action Portfolio.auth_action, except: [:show]

      def index
        @items = resource.where(site: @site)
      end

      def new
        @item = resource.new site: @site
      end

      def edit
        @image = SiteItemImage.new site_item: @item
      end

      def create
        @item = resource.new(item_project_params)

        if @item.save
          redirect_to [:edit, :admin, @site, @item], notice: 'Item project was successfully created.'
        else
          render :new
        end
      end

      def update
        if @item.update(item_project_params)
          redirect_to [:edit, :admin, @site, @item], notice: 'Item project was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @item.destroy
        redirect_to [:admin, @site, @resource_name_p], notice: 'Item project was successfully destroyed.'
      end

      private
        def set_item
          @item = resource.find(params[:id])
          @default_image = @item.default_image if @item
        end

        def item_project_params
          params.require(@resource_name)
            .permit(:site_id, :title, :site_item_category_id, :featured, :body, 
                    :url, :public, site_item_tag_ids: [])
        end

        def set_site
          @site = Site.find params[:site_id]
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
end
