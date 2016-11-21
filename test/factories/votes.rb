FactoryGirl.define do
  factory :vote do
    user_id '212c0a58-87e1-4a33-9ed3-391aeff670a5'
    value 'up'

    factory :neighborhood_alert_comment_vote do
      association :votable, factory: :neighborhood_alert_comment
    end

    factory :route_alert_comment_vote do
      association :votable, factory: :route_alert_comment
    end

    factory :neighborhood_alert_vote do
      association :votable, factory: :neighborhood_alert
    end

    factory :route_alert_vote do
      association :votable, factory: :route_alert
    end
  end
end
