FactoryBot.define do
  factory :comment do
    content { "sample content" }
    task
    user
  end
end
