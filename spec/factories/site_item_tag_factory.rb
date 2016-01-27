FactoryGirl.define do
  factory :site_item_tag, class: Portfolio::SiteItemTag do
    name { Faker::Lorem.word }
  end
end
