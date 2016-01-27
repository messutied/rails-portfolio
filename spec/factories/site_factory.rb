module Portfolio
  FactoryGirl.define do
    factory :site, class: Portfolio::Site do
      person_name { Faker::Name.name }
      job_title   { Faker::Name.title }
      greetings   { Faker::Lorem.sentence }
      summary     { Faker::Lorem.paragraph }

      factory :site_with_projects do
        after :create do |site, evaluator|
          create_list :site_project, 2, site: site, public: true
          create_list :site_project, 2, site: site, public: false
        end
      end

      factory :site_with_categorized_projects do
        after :create do |site, evaluator|
          categ1 = create :site_item_category
          categ2 = create :site_item_category

          create :site_project_with_category, site: site,
                 public: true, site_item_category: categ1, featured: true

          create :site_project_with_category, site: site,
                 public: false, site_item_category: categ2

          create :site_project_with_category, site: site,
                 public: true, site_item_category: categ2

          create :site_project_with_category, site: site,
                 public: false, site_item_category: categ1
        end
      end
    end
  end
end
