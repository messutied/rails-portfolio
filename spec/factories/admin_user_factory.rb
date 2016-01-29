FactoryGirl.define do
  factory :admin_user, class: Portfolio::AdminUser do
    pass = Faker::Internet.password
    email Faker::Internet.email
    password pass

    before(:validation) do |user|
      user.password_confirmation = pass
    end
  end
end
