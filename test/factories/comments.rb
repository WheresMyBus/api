FactoryGirl.define do
  factory :comment do
    message 'Comment message goes here...'
    user_id 'c2d4a52b-677f-4552-a08a-d62d4384d32e'

    factory :neighborhood_alert_comment do
      association :commentable, factory: :neighborhood_alert
    end

    factory :route_alert_comment do
      association :commentable, factory: :route_alert
    end
  end
end
