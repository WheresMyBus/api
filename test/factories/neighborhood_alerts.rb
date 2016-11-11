FactoryGirl.define do
  factory :neighborhood_alert do
    issue_type 'construction'
    description 'Alert description goes here...'
    user_id '7e4302f0-a1eb-45c5-ac2f-88bb43b5617c'
    neighborhood
  end
end
