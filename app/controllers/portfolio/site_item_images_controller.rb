require_dependency "portfolio/application_controller"

module Portfolio
  class SiteItemImagesController < ApplicationController
    before_action :set_image, only: [:update, :destroy, :set_default]
    before_action :set_project
    before_action Portfolio.auth_action

    layout 'portfolio/admin'

    # POST /item_projects
    def create
      @image = SiteItemImage.new(image_params)

      if @image.save
        redirect_to edit_project_path, notice: 'Image was successfully created.'
      else
        @item = @item_project.item
        render template: 'portfolio/item_projects/edit'
      end
    end

    # PATCH/PUT /item_projects/1
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

    # DELETE /item_projects/1
    def destroy
      @image.destroy
      redirect_to edit_project_path, notice: 'Image was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_image
        @image = SiteItemImage.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:site_item_image).permit(:site_item_id, :image, :default)
      end

      def set_project
        @item_project = SiteItem.find params[:site_item_id]
      end

      def edit_project_path
        [:edit, @item_project.site, @item_project]
      end
  end
end
