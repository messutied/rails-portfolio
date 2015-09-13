require_dependency "portfolio/application_controller"

module Portfolio
  class Admin::SiteItemImagesController < ApplicationController
    before_action :set_image, only: [:update, :destroy, :set_default]
    before_action :set_project
    before_action Portfolio.auth_action

    layout 'portfolio/admin'

    def create
      @image = SiteItemImage.new(image_params)

      if @image.save
        redirect_to edit_project_path, notice: 'Image was successfully created.'
      else
        @item = @item_project.item
        render template: 'portfolio/item_projects/edit'
      end
    end

    def update
      if @image.update(image_params)
        redirect_to edit_project_path, notice: 'Image was successfully updated.'
      else
        render :edit
      end
    end

    def set_default
      @image.update(default: true)
      redirect_to edit_project_path, notice: 'Image was successfully updated.'
    end

    def destroy
      @image.destroy
      redirect_to edit_project_path, notice: 'Image was successfully destroyed.'
    end

    private
      def set_image
        @image = SiteItemImage.find(params[:id])
      end

      def image_params
        params.require(:site_item_image).permit(:site_item_id, :image, :default)
      end

      def set_project
        if klass = SiteItem.subclasses.detect { |kl| params[:"#{kl.resource_name}_id"].present? }
          @item_project = klass.find params[:"#{klass.resource_name}_id"]
        end
      end

      def edit_project_path
        [:edit, :admin, @item_project.site, @item_project]
      end
  end
end
