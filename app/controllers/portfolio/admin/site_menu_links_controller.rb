module Portfolio
  module Admin
    class SiteMenuLinksController < ApplicationController
      before_action :set_site_menu_link, only: [:show, :edit, :update, :destroy]
      before_action :set_site
      before_action Portfolio.auth_action

      def index
        @site_menu_links = @site.site_menu_links.all
      end

      def show
      end

      def new
        @site_menu_link = SiteMenuLink.new site: @site
      end

      def edit
      end

      def create
        @site_menu_link = SiteMenuLink.new(site_menu_link_params)

        if @site_menu_link.save
          redirect_to [:admin, @site, :site_menu_links], notice: 'Item menu link was successfully created.'
        else
          render :new
        end
      end

      def update
        if @site_menu_link.update(site_menu_link_params)
          redirect_to [:admin, @site, :site_menu_links], notice: 'Item menu link was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @site_menu_link.destroy
        redirect_to [:admin, @site, :site_menu_links], notice: 'Item menu link was successfully destroyed.'
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_site_menu_link
          @site_menu_link = SiteMenuLink.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def site_menu_link_params
          params.require(:site_menu_link).permit(:site_id, :name, :url)
        end

        def set_site
          @site = Site.find params[:site_id]
        end
    end
  end
end
