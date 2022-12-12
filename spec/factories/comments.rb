FactoryBot.define do
  factory :comment do
    content { "content sample" }
    task
    user
  end
end
