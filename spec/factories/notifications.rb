FactoryBot.define do
  factory :notification do
    task { nil }
    action { "MyString" }
    info { "MyString" }
    data { "" }
  end
end
