Dream.destroy_all
User.destroy_all

antou = User.create!(email: "antoine@dream.fr", password: "123456", nickname: "antou")

mik = User.create!(email: "mik@dream.fr", password: "123456", nickname: "mikmik")

taib = User.create!(email: "taib@dream.fr", password: "123456", nickname: "taibinho")

carlos = User.create!(email: "carlo@dream.fr", password: "123456", nickname: "carlos")


Dream.create!(title: "A dream full of stars"  ,
              description: "It is a lovely day in my mind" ,
              category: ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler"].sample,
              price_per_night: rand(25..50),
              age_limit: rand(12..20) ,
              number_of_roles: rand(1..4) ,
              user: antou
            )

Dream.create!(title: "A dream full of love"  ,
  description: "It is a lovely night in my mind" ,
  category: ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler"].sample,
  price_per_night: rand(25..50),
  age_limit: rand(12..20) ,
  number_of_roles: rand(1..4) ,
  user: mik
)

Dream.create!(title: "A dream full of war"  ,
  description: "It is a awwful day in my mind" ,
  category: ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler"].sample,
  price_per_night: rand(25..50),
  age_limit: rand(12..20) ,
  number_of_roles: rand(1..4) ,
  user: taib
)

Dream.create!(title: "A dream full of sport"  ,
  description: "It is a lovely day in my sportday" ,
  category: ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler"].sample,
  price_per_night: rand(25..50),
  age_limit: rand(12..20) ,
  number_of_roles: rand(1..4) ,
  user: carlos
)
