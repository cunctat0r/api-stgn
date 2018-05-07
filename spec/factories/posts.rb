FactoryBot.define do
  factory :post do
    main_phone_number { Faker::PhoneNumber.cell_phone }
    line_name { Faker::Beer.name }
    num_tower { Faker::Number.number(3) }
  end
end
