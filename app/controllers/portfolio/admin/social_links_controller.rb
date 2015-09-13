require_dependency "portfolio/application_controller"

module Portfolio
  class Admin::SocialLinksController < ApplicationController
    before_action :set_social_link, only: [:show, :edit, :update, :destroy]

    layout 'portfolio/admin'

    def index
      @social_links = SocialLink.all
    end

    def show
    end

    def new
      @social_link = SocialLink.new
    end

    def edit
    end

    def create
      @social_link = SocialLink.new(social_link_params)

      if @social_link.save
        redirect_to [:admin, :social_links], notice: 'Social link was successfully created.'
      else
        render :new
      end
    end

    def update
      if @social_link.update(social_link_params)
        redirect_to [:admin, :social_links], notice: 'Social link was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @social_link.destroy
      redirect_to [:admin, :social_links], notice: 'Social link was successfully destroyed.'
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
