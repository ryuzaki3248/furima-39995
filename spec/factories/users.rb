FactoryBot.define do
  factory :user do
    nickname { 'やまだ' }
    email { 'aa@aa' }
    password { 'aaa111' }
    password_confirmation { 'aaa111' }
    full_width_last_name { '山田' }
    full_width_first_name { '太郎' }
    full_width_last_name_kana { 'ヤマダ' }
    full_width_first_name_kana { 'タロウ' }
    birth_date { '1930-01-01' }
  end
end