FactoryBot.define do
  factory :user do
    nickname {"taro"}
    email {Faker::Internet.free_email}
    password {"abcd1234"}
    password_confirmation {"abcd1234"}
    first_name {"山田"}
    last_name {"太郎"}
    first_name_kana {"ヤマダ"}
    last_name_kana {"タロウ"}
    birth {"1999-01-01"}
  end
end
