FactoryGirl.define do
  factory :site_item, class: Portfolio::SiteItem do
    title 'Test child'
    site { create(:site) }
  end
end
