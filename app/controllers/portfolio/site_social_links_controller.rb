module Portfolio
  class SiteSocialLinksController < ApplicationController
    before_action :set_link, only: [:show, :edit, :update, :destroy]
    before_action :set_site
    before_action Portfolio.auth_action

    layout 'portfolio/admin'

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
          format.html { redirect_to site_site_social_links_path(@site), notice: 'Social link was successfully created.' }
          format.json { render :show, status: :created, location: @link }
        else
          format.html { render :new }
          format.json { render json: @link.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @link.update(link_params)
          format.html { redirect_to site_site_social_links_path(@site), notice: 'Social link was successfully updated.' }
          format.json { render :show, status: :ok, location: @link }
        else
          format.html { render :edit }
          format.json { render json: @link.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @link.destroy
      respond_to do |format|
        format.html { redirect_to site_site_social_links_url(@site), notice: 'Social link was successfully destroyed.' }
        format.json { head :no_content }
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
