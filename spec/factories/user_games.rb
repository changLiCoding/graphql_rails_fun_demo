FactoryBot.define do
  factory :user_game do
    user { nil }
    game { nil }
    private { false }
    review { "MyString" }
    rating { 1 }
    game_note { "MyString" }
    start_date { "2023-04-14" }
    completed_date { "2023-04-14" }
    game_status { "MyString" }
  end
end
