require_dependency "portfolio/application_controller"

module Portfolio
  class SocialLinksController < ApplicationController
    before_action :set_social_link, only: [:show, :edit, :update, :destroy]

    layout 'portfolio/admin'

    # GET /social_links
    def index
      @social_links = SocialLink.all
    end

    # GET /social_links/1
    def show
    end

    # GET /social_links/new
    def new
      @social_link = SocialLink.new
    end

    # GET /social_links/1/edit
    def edit
    end

    # POST /social_links
    def create
      @social_link = SocialLink.new(social_link_params)

      if @social_link.save
        redirect_to social_links_path, notice: 'Social link was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /social_links/1
    def update
      if @social_link.update(social_link_params)
        redirect_to social_links_path, notice: 'Social link was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /social_links/1
    def destroy
      @social_link.destroy
      redirect_to social_links_path, notice: 'Social link was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_social_link
        @social_link = SocialLink.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def social_link_params
        params.require(:social_link).permit(:name, :url_pattern, :image)
      end
  end
end
