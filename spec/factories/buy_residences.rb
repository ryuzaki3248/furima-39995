FactoryBot.define do
  factory :buy_residence do
    post_code {"123-4567"}
    prefecture_id {"2"}
    municipalities {"横浜市"}
    street_address {"青山1−1"}
    building_name {"サーパス101"}    
    telephone_number {"09012341234"}    
    token {"tok_abc123456789123456789"}
    
    association :user
    association :item

  end
end
