module Portfolio
  class Admin::SitesController < ApplicationController
    before_action :set_site, only: [:show, :edit, :update, :destroy]
    before_action Portfolio.auth_action

    layout 'portfolio/admin'

    def index
      @sites = Site.all
    end

    def new
      @site = Site.new
    end

    def edit
    end

    def create
      @site = Site.new(item_params)

      respond_to do |format|
        if @site.save
          format.html { redirect_to [:admin, @site], notice: 'Site was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @site.update(item_params)
          format.html { redirect_to [:admin, @site], notice: 'Site was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @site.destroy
      respond_to do |format|
        format.html { redirect_to [:admin, :sites], notice: 'Site was successfully destroyed.' }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_site
        @site = Site.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def item_params
        params.require(:site).permit(:key, :job_title, :summary, :avatar, :default, :email, :person_name, :greetings)
      end
  end
end
