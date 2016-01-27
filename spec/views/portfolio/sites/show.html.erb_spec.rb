require 'rails_helper'

module Portfolio
  RSpec.describe 'portfolio/sites/show' do
    before do
      view.extend ApplicationHelper, SiteItemsHelper

      assign :site, site
      assign :featured_projects, site.site_projects.published.featured
      render
    end

    context 'without projects' do
      let(:site) { create :site }

      it 'displays a portfolio site\'s basic information' do
        expect(rendered).to match /#{site.greetings}/
        expect(rendered).to match /#{site.summary}/
      end

      it 'does not display any projects' do
        expect(rendered).not_to match /Portfolio/
      end
    end

    context 'with projects' do
      let(:site) { create :site_with_categorized_projects }

      it 'displays featured projects' do
        expect(rendered).to match /Portfolio/
        expect(rendered).to match /#{site.site_projects.published.featured.first.title}/
      end
    end
  end
end
