FactoryBot.define do
  factory :purchases_buyers do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end