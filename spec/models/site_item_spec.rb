require 'rails_helper'


module Portfolio
  RSpec.describe SiteItem, type: :model do
    context 'with a class that inherits from SiteItem' do
      before do
        class SiteItemChild < SiteItem; end
      end

      let!(:child) {
        SiteItemChild.create title: 'Test child', site: create(:site)
      }

      it 'automatically assigns a type based in the child class' do
        expect(child).to be_valid
        expect(child.type).to eq('Portfolio::SiteItemChild')
      end

      it 'filters based on the type' do
        item = create(:site_item)

        expect(item).to be_valid
        expect(SiteItemChild.count).to be 1
        expect(SiteItemChild.first.type).to eq('Portfolio::SiteItemChild')
      end

      it 'should return its resource name for usage in paths construction' do
        expect(SiteItemChild.resource_name).to eq 'site_item_child'
      end

      it 'should return its human name for usage in views' do
        expect(SiteItemChild.human_name).to eq 'child'
      end

      it 'returns the list of subclases' do
        expect(SiteItem.subclasses).to eq [SiteProject]
      end
    end
  end
end
