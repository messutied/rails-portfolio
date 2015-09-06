require_dependency "portfolio/application_controller"

module Portfolio
  class SiteProjectsController < SiteItemsController
    private
      def resource
        SiteProject
      end
  end
end
