FactoryBot.define do
  factory :sale do
    name                        { 'abc' }
    text                        { 'abc' }
    price                       { 400 }
    genre_id                       { 2 }
    status_id                      { 2 }
    fee_id                         { 2 }
    area_id                        { 2 }
    day_id                         { 2 }
    association :user
  end
end
