module Portfolio
  module Admin
    class ApiController < ApplicationController
      include SitesHelper
      
      before_action Portfolio.auth_action
      
      def markdown_preview
        render json: { html: render_markdown(params[:text]) }
      end
    end
  end
end
