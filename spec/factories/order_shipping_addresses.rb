FactoryBot.define do
  factory :order_shipping_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal { "123-4567" }
    city { '横浜市' }
    address { '青山1-1-1'}
    phone_number { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    country_id { 2 }
    build { '柳ビル103' }
  end
end
