FactoryGirl.define do
  factory :vote do
    user_id '212c0a58-87e1-4a33-9ed3-391aeff670a5'
    value 'up'

    trait :comment do
      association :votable, factory: :comment
    end

    trait :neighborhood_alert do
      association :votable, factory: :neighborhood_alert
    end

    trait :route_alert do
      association :votable, factory: :route_alert
    end
  end
end
