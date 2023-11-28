FactoryBot.define do
  factory :item do
    product_name { 'おもち' }
    product_description { 'お正月のお餅です' }
    category_id { '2' }
    product_condition_id { '2' }
    burden_of_shipping_charges_id { '2' }
    prefecture_id { '2' }
    number_of_days_until_shipping_id { '2' }
    selling_price { '333' }
    association :user
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end


  end
end

