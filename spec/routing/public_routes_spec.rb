require 'rails_helper'

module Portfolio
  RSpec.describe 'public routes', type: :routing do
    routes { Portfolio::Engine.routes }

    let(:site) { create :site_with_categorized_projects }
    let(:project) { site.site_projects.sample }
    let(:tag) { SiteItemTag.first.key }

    it 'routes to the /portfolio-key-name page' do
      expect(get: "/#{site.key}").to route_to(
        controller: "portfolio/sites", action: 'show_by_key', portfolio_key: site.key
      )
    end

    it 'routes to a portfolio item' do
      expect(get: "/#{site.key}/portfolio/#{project.path_key}").to route_to(
        controller: "portfolio/site_projects", action: 'show',
        portfolio_key: site.key, id: project.id.to_s,
        title: project.path_title
      )
    end

    it 'routes to portfolio index' do
      expect(get: "/#{site.key}/portfolio").to route_to(
        controller: "portfolio/site_projects", action: 'index',
        portfolio_key: site.key
      )
    end

    it 'routes to portfolio tagged items' do
      expect(get: "/#{site.key}/portfolio/tagged/#{tag}").to route_to(
        controller: "portfolio/site_projects", action: 'index',
        portfolio_key: site.key, tag_key: tag
      )
    end
  end
end
