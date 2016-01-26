module Portfolio
  FactoryGirl.define do
    factory :site, class: Portfolio::Site do
      person_name 'some dude'
      job_title 'manager'
    end
  end
end
