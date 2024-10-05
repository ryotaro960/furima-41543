FactoryBot.define do
  factory :trade_record_sending_address do
    transient do
      address { Gimei.address }
    end

    post_code{Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    sending_city{address.city.kanji}
    sending_banchi{Faker::Address.street_address}
    sending_building{Faker::Company.name}
    sending_phone{Faker::Number.leading_zero_number(digits: 11)}
    token {"tok_abcdefghijk00000000000000000"}
    
  end
end