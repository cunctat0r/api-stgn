FactoryBot.define do
  factory :measurement do
    Upit  { Faker::Number.decimal(2, 1) }
  end
end

