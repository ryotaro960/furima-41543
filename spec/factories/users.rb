
FactoryBot.define do

  factory :user do
    transient do
      namae { Gimei.name }
    end
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    namae = Gimei.name
    family_name_full {namae.family.kanji}
    first_name_full {namae.first.kanji}
    family_name_kana {namae.family.katakana}
    first_name_kana {namae.first.katakana}
    birth_date{Faker::Date.birthday(min_age: 5, max_age: 93)}
  end

end