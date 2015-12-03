module Portfolio
  module Admin
    class SiteSocialLinksController < ApplicationController
      before_action :set_link, only: [:show, :edit, :update, :destroy]
      before_action :set_site
      before_action Portfolio.auth_action

      # TODO: replace horrible method paths with [res, res, ...] format (not working for some reason)
      def index
        @links = @site.site_social_links
      end

      def show
      end

      def new
        @link = SiteSocialLink.new site: @site
      end

      def edit
      end

      def create
        @link = SiteSocialLink.new(link_params)

        respond_to do |format|
          if @link.save
            format.html { redirect_to [:admin, @site, :site_social_links], notice: 'Social link was successfully created.' }
          else
            format.html { render :new }
          end
        end
      end

      def update
        respond_to do |format|
          if @link.update(link_params)
            format.html { redirect_to [:admin, @site, :site_social_links], notice: 'Social link was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
      end

      def destroy
        @link.destroy
        respond_to do |format|
          format.html { redirect_to [:admin, @site, :site_social_links], notice: 'Social link was successfully destroyed.' }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_link
          @link = SiteSocialLink.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def link_params
          params.require(:social_link).permit(:social_link_id, :site_id, :user_name)
        end

        def set_site
          @site = Site.find params[:site_id]
        end
    end
  end
end
