module Portfolio
  module Admin
    class SiteItemsController < ApplicationController
      before_action Portfolio.auth_action
      before_action :set_item, only: [:edit, :update, :destroy]
      before_action :set_site
      before_action :set_resource_name

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
        @item = resource.new(item_project_params.merge(site_id: params[:site_id]))

        if @item.save
          redirect_to [:edit, :admin, @site, @item], notice: 'Item project was successfully created.'
        else
          render :new
        end
      end

      def update
        resp = @item.update(item_project_params)

        respond_to do |format|
          format.html {
            if resp
              redirect_to [:edit, :admin, @site, @item], notice: 'Item project was successfully updated.'
            else
              render :edit
            end
          }

          format.json {
            if resp
              render json: @item
            else
              render json: { errors: @item.errors.full_messages }, status: 400
            end
          }
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
          @resource_name = resource.resource_name
          @resource_name_p = @resource_name.pluralize
          @resource_name_h = resource.human_name
        end

        def resource
          raise NotImplementedError
        end
    end
  end
end
