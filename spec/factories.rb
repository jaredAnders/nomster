FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password "passw0rd"
    password_confirmation "passw0rd"
  end

  factory :place do
    name "test-place"
    address  "123 Main St"
    description "An excellent description"
    association :user
  end

  factory :comment do
    message "An excellent comment"
    rating {rand(1..5)}
    association :user
    association :place
  end
end
