require 'rails_helper'

module Portfolio
  RSpec.describe 'portfolio/site_projects/index' do
    before do
      view.extend ApplicationHelper, SiteItemsHelper, SitesHelper
    end

    context 'with uncategorized projects' do
      let(:site) { create(:site_with_projects) }

      before do
        assign(:site, site)
        render
      end

      it 'displays all published projects' do
        expect(rendered).to match /#{site.site_projects.published.sample.title}/
      end

      it 'doesn\'t display unpublished' do
        expect(rendered).not_to match /#{site.site_projects.unpublished.sample.title}/
      end
    end

    context 'with categorized projects' do
      let(:site) { create(:site_with_categorized_projects) }

      before do
        assign(:site, site)
        render
      end

      it 'displays all published projects' do
        expect(rendered).to match /#{SiteItemCategory.first.name}/
        expect(rendered).to match /#{site.site_projects.published.sample.title}/
      end

      it 'doesn\'t display unpublished' do
        expect(rendered).to match /#{SiteItemCategory.first.name}/
        expect(rendered).not_to match /#{site.site_projects.unpublished.sample.title}/
      end
    end
  end
end
