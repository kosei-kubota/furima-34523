FactoryBot.define do
  factory :item do
    name {"あああ"}
    price {10000}
    description {"あいうえお"}
    category_id { 2 }
    condition_id { 2 }
    burden_id { 2 }
    country_id { 2 }
    day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
