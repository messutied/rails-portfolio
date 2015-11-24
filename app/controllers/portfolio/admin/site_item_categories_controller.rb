require_dependency "portfolio/application_controller"

module Portfolio
  class Admin::SiteItemCategoriesController < ApplicationController
    before_action :set_admin_site_item_category, only: [:show, :edit, :update, :destroy]
    before_action Portfolio.auth_action
    
    layout 'portfolio/admin'

    def index
      @admin_site_item_categories = SiteItemCategory.all
    end

    def new
      @admin_site_item_category = SiteItemCategory.new
    end

    def edit
    end

    def create
      @admin_site_item_category = SiteItemCategory.new(admin_site_item_category_params)

      if @admin_site_item_category.save
        redirect_to admin_site_item_categories_path, notice: 'Site item category was successfully created.'
      else
        render :new
      end
    end

    def update
      if @admin_site_item_category.update(admin_site_item_category_params)
        redirect_to admin_site_item_categories_path, notice: 'Site item category was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @admin_site_item_category.destroy
      redirect_to admin_site_item_categories_path, notice: 'Site item category was successfully destroyed.'
    end

    private
      def set_admin_site_item_category
        @admin_site_item_category = SiteItemCategory.find(params[:id])
      end

      def admin_site_item_category_params
        params.require(:site_item_category).permit(:key, :name)
      end
  end
end
