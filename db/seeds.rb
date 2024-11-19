require "open-uri"


Dream.destroy_all
User.destroy_all

antou = User.create!(email: "antoine@dream.fr", password: "123456", nickname: "antou")

mik = User.create!(email: "mik@dream.fr", password: "123456", nickname: "mikmik")

taib = User.create!(email: "taib@dream.fr", password: "123456", nickname: "taibinho")

carlos = User.create!(email: "carlo@dream.fr", password: "123456", nickname: "carlos")


# file1 = URI.parse("https://res-console.cloudinary.com/dhwtnnav8/thumbnails/v1/image/upload/v1732030487/ZHJlYW1kZWFsZXIvYWVsNmN2ZXJlaWhlczlwMWxobmk=/drilldown").open
# dream_picture = Dream.new(title: "NES", body: "A great console")
# dream_picture.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# dream_picture.save


dream_1 = Dream.create!(title: "A dream full of stars"  ,
              description: "It is a lovely day in my mind" ,
              category: ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler"].sample,
              price_per_night: rand(25..50),
              age_limit: rand(12..20) ,
              number_of_roles: rand(1..4) ,
              user: antou
            )
file1 = URI.parse("https://www.meshistoiresdusoir.fr/static/images/histoires/histoires-de-chevaliers-le-chevalier-courageux-et-la-quete-pour-proteger-le-royaume-544.jpg").open
dream_1.photo.attach(io: file1, filename: "dream1.png", content_type: "image/png")



# dream_2 = Dream.create!(title: "A dream full of love"  ,
#   description: "It is a lovely night in my mind" ,
#   category: ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler"].sample,
#   price_per_night: rand(25..50),
#   age_limit: rand(12..20) ,
#   number_of_roles: rand(1..4) ,
#   user: mik
# )

# dream_3 = Dream.create!(title: "A dream full of war"  ,
#   description: "It is a awwful day in my mind" ,
#   category: ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler"].sample,
#   price_per_night: rand(25..50),
#   age_limit: rand(12..20) ,
#   number_of_roles: rand(1..4) ,
#   user: taib
# )

# dream_4 =Dream.create!(title: "A dream full of sport"  ,
#   description: "It is a lovely day in my sportday" ,
#   category: ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler"].sample,
#   price_per_night: rand(25..50),
#   age_limit: rand(12..20) ,
#   number_of_roles: rand(1..4) ,
#   user: carlos
# )
