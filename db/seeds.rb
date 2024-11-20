require "open-uri"
require "faker"


Booking.destroy_all
Dream.destroy_all
User.destroy_all

antou = User.create!(email: "antoine@dream.fr", password: "123456", nickname: "antou")

mik = User.create!(email: "mik@dream.fr", password: "123456", nickname: "mikmik")

taib = User.create!(email: "taib@dream.fr", password: "123456", nickname: "taibinho")

carlos = User.create!(email: "carlo@dream.fr", password: "123456", nickname: "carlos")


url = "http://tmdb.lewagon.com/movie/top_rated"

3.times do |i|
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)["results"]
  movies.each do |movie|
    puts "Creating #{movie["title"]}"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    dream = Dream.create!(title: movie["title"],
      description: movie["overview"] ,
      category: ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler"].sample,
      price_per_night: rand(25..100),
      age_limit: rand(12..20) ,
      number_of_roles: rand(1..4) ,
      user: [antou, taib, carlos, mik].sample
    )
    file_photo = URI.parse("#{base_poster_url}#{movie["backdrop_path"]}").open
    dream.photos.attach(io: file_photo, filename: "dream#{i + 1}.png", content_type: "image/png")
  end
end
puts "finished"


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
