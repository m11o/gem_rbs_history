FactoryBot.define do
  factory :typed_gem_history do
    merged_at { Time.zone.now }
    gem_name { Faker::Lorem.word }
    gem_version { Faker::Lorem.word }
    user_id { Faker::Lorem.word }
    user_name { Faker::Lorem.word }
    pr_number { Faker::Lorem.word }
  end
end
