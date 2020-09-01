FactoryBot.define do
  factory :users_buy do
    code               { '123-4567' }
    area_id            { '2' }
    city               { 'あいう' }
    address            { 'あいう' }
    tel                { '12345678912' }
    token              { '123' }
  end
end
