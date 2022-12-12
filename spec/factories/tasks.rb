FactoryBot.define do
  factory :task do
    project
    name { "name sample" }
    title { "title sample" }
    description { "description" }
    deadline_at { Time.now + 2.weeks  }
  end
end
