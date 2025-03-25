FactoryBot.define do
  factory :team_member do
    team { nil }
    user { nil }
    role { "MyString" }
  end
end
