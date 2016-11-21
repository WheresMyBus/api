FactoryGirl.define do
  factory :report do
    user_id 'feeace92-34c8-4ecf-85a7-cb075eb054d3'

    factory :neighborhood_alert_comment_report do
      association :reportable, factory: :neighborhood_alert_comment
    end

    factory :route_alert_comment_report do
      association :reportable, factory: :route_alert_comment
    end

    factory :neighborhood_alert_report do
      association :reportable, factory: :neighborhood_alert
    end

    factory :route_alert_report do
      association :reportable, factory: :route_alert
    end
  end
end
