FactoryGirl.define do
  factory :site_item_category, class: Portfolio::SiteItemCategory do
    name { Faker::Lorem.word }
  end
end
