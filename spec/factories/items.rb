FactoryBot.define do
  factory :item do
    
    name          {"名前"}
    description    {"説明"}
    price           {1000}
    item_condition_id  {2}
    shipping_cost_id   {2}
    shipping_days_id   {2}
    prefecture_id      {2}
    category_id        {2}
    association :user

    after(:build) do |item|
      File.open("#{Rails.root}/spec/images/001.jpg") do |f|
        item.image.attach(io: File.open('spec/images/001.jpg'), filename: '001.jpg')
      end
    end
  end
end