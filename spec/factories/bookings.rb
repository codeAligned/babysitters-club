FactoryGirl.define do
  factory :booking do
    duration 30
    desired_time DateTime.new(2016,8,26,4,5,6)
  end
end
