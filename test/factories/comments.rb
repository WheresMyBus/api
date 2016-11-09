FactoryGirl.define do
  factory :comment do
    commentable nil
    user_id "MyString"
    message "MyText"
  end
end
