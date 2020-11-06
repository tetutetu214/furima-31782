FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.hiragana }
    last_name_kana        { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birth_date            { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
