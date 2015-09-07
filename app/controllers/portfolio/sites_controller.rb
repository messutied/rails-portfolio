module Portfolio
  class SitesController < ApplicationController
    before_action :set_site, only: [:show, :edit, :update, :destroy]
    before_action Portfolio.auth_action, except: [:default]

    layout 'portfolio/admin'

    def index
      @sites = Site.all
    end

    def show
      render layout: 'portfolio/portfolio'
    end

    def show_by_key
      @site = Site.find_by(key: params[:portfolio_key])
      render :show, layout: 'portfolio/portfolio'
    end

    def default
      @site = Site.where(default: true).first
      render :show, layout: 'portfolio/portfolio'
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
          format.html { redirect_to @site, notice: 'Site was successfully created.' }
          format.json { render :show, status: :created, location: @site }
        else
          format.html { render :new }
          format.json { render json: @site.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @site.update(item_params)
          format.html { redirect_to @site, notice: 'Site was successfully updated.' }
          format.json { render :show, status: :ok, location: @site }
        else
          format.html { render :edit }
          format.json { render json: @site.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @site.destroy
      respond_to do |format|
        format.html { redirect_to portfolio_items_url, notice: 'Site was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_site
        @site = Site.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def item_params
        params.require(:site).permit(:key, :job_title, :summary, :avatar, :default, :email, :person_name)
      end
  end
end