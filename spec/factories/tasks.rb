FactoryBot.define do
  factory :task do
    title { "title sample" }
    description { "description samples" }
    deadline_at { Time.now + 2.days }
    project
  end
end
