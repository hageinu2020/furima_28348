FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"a1b2c3"}
    password_confirmation {password}
    family_name           {"あいう"}
    first_name            {"あいう"}
    family_kana           {"アイウ"}
    first_kana            {"アイウ"}
    birthday              {"1234/08/08"}
  end
end