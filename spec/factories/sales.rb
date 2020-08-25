FactoryBot.define do
  factory :sale do
    name                        { 'abc' }
    text                        { 'abc' }
    price                       { 400 }
    genre_id                       { 1 }
    status_id                      { 1 }
    fee_id                         { 1 }
    area_id                        { 1 }
    day_id                         { 1 }
    association :user
  end
end
