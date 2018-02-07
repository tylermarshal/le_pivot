FactoryBot.define do
  factory :store do
    sequence(:name) {|n| "Name #{n}" }
    status 0
  end
end
