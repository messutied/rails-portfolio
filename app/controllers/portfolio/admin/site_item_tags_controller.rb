require_dependency "portfolio/application_controller"

module Portfolio
  class Admin::SiteItemTagsController < ApplicationController
    before_action Portfolio.auth_action
    before_action :set_admin_site_item_tag,
                  only: [:show, :edit, :update, :destroy]
    
    layout 'portfolio/admin'

    def index
      @tags = SiteItemTag.all
    end

    def new
      @tag = SiteItemTag.new
    end

    def edit
    end

    def create
      @tag = SiteItemTag.new(admin_site_item_tag_params)

      if @tag.save
        redirect_to admin_site_item_tags_path,
          notice: 'Site item tag was successfully created.'
      else
        render :new
      end
    end

    def update
      if @tag.update(admin_site_item_tag_params)
        redirect_to admin_site_item_tags_path,
          notice: 'Site item tag was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @tag.destroy
      redirect_to admin_site_item_tags_path,
        notice: 'Site item tag was successfully destroyed.'
    end

    private
      def set_admin_site_item_tag
        @tag = SiteItemTag.find(params[:id])
      end

      def admin_site_item_tag_params
        params.require(:site_item_tag).permit(:key, :name)
      end
  end
end
