module Portfolio
  module Admin
    class SiteItemCategoriesController < ApplicationController
      before_action Portfolio.auth_action
      before_action :set_admin_site_item_category,
                    only: [:show, :edit, :update, :destroy]

      def index
        @categories = SiteItemCategory.all
      end

      def new
        @categ = SiteItemCategory.new
      end

      def edit
      end

      def create
        @categ = SiteItemCategory.new(admin_site_item_category_params)

        if @categ.save
          redirect_to admin_site_item_categories_path,
            notice: 'Site item category was successfully created.'
        else
          render :new
        end
      end

      def update
        if @categ.update(admin_site_item_category_params)
          redirect_to admin_site_item_categories_path,
            notice: 'Site item category was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @categ.destroy
        redirect_to admin_site_item_categories_path,
          notice: 'Site item category was successfully destroyed.'
      end

      private
        def set_admin_site_item_category
          @categ = SiteItemCategory.find(params[:id])
        end

        def admin_site_item_category_params
          params.require(:site_item_category).permit(:key, :name)
        end
    end
  end
end
