FactoryBot.define do
  factory :user do
    nickname { :"たぬぅ" }
    email    { :"bbb@bbb" }
    password { :bbbccc2 }
    password_confirmation { password }
    last_name { :"富士樹海" }
    first_name { :"たぬきち" }
    last_name_kana { :"フジジュカイ" }
    first_name_kana { :"タヌキチ" }
    birth_date { :"1990-01-01" }
  end
end
