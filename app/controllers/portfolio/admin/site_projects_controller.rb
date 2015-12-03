module Portfolio
  module Admin
    class SiteProjectsController < SiteItemsController
      private
        def resource
          SiteProject
        end
    end
  end
end
