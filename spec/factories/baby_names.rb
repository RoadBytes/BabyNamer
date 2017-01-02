FactoryGirl.define do
  factory :baby_name do
    sequence :name do |n|
      "Tallulah#{n}"
    end
    background 'This is the best name ever'
  end
end
