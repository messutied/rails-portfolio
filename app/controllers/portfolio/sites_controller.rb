module Portfolio
  class SitesController < ApplicationController
    before_action :set_site, only: [:show, :edit, :update, :destroy]

    layout 'portfolio/portfolio'

    def show_by_key
      @site = Site.find_by(key: params[:portfolio_key])
      render :show
    end

    def default
      @site = Site.where(default: true).first
      render :show
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
