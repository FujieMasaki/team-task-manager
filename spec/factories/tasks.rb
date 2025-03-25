FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    status { "MyString" }
    priority { "MyString" }
    due_date { "2025-03-24" }
    project { nil }
    assignee { nil }
    created_by { nil }
  end
end
