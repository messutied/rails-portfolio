module Portfolio
  class SitesController < ApplicationController

    layout 'portfolio/portfolio'

    def show_by_key
      @site = Site.find_by(key: params[:portfolio_key])
      set_projects
      render :show
    end

    def default
      @site = Site.where(default: true).first
      set_projects
      render :show
    end

    private
      def set_projects
        @featured_projects = @site.site_projects.published.featured
      end

      def item_params
        params.require(:site).permit(:key, :job_title, :summary, :avatar, :default, :email, :person_name, :greetings)
      end
  end
end
