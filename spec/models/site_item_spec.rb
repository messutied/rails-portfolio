require 'rails_helper'


module Portfolio
  RSpec.describe SiteItem, type: :model do
    it 'assigns a type to models of classes that inherit from it' do
      class SiteItemChild < SiteItem; end
      site = create(:site)
      child = SiteItemChild.create title: 'Test child', site: site

      expect(child).to be_valid
      expect(child.site_item_type).to eq('SiteItemChild')
    end
  end
end
