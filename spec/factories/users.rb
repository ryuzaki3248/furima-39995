# FactoryBot.define do
#   factory :user do
#     name {Faker::Name.last_name}
#     email {Faker::Internet.email}
#     password {Faker::Internet.password(min_length: 6)}
#     password_confirmation {password}
#   end
# end

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    full_width_last_name { Faker::Name.last_name }
    full_width_first_name { Faker::Name.first_name }
    full_width_last_name_kana { Faker::Name.last_name }
    full_width_first_name_kana { Faker::Name.first_name }
    birth_date { Faker::Date.birthday }
  end
end