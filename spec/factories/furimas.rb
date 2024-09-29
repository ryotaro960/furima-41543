FactoryBot.define do
  factory :furima do

    item_name {Faker::Config.random}
    explanation{Faker::Lorem.sentence}
    category_id{Faker::Number.between(from: 2, to: 11)}
    status_id {Faker::Number.between(from: 2, to: 7)}
    payer_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 49)}
    waiting_id {Faker::Number.between(from: 5, to: 4)}
    price {Faker::Number.between(from: 300, to:9999999)}

    association :user

    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
