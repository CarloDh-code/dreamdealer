require "open-uri"
require "faker"
require 'cloudinary'


Booking.destroy_all
Dream.destroy_all
User.destroy_all

DESCS = [ " You plunge into a city ablaze, forced to leap across rooftops and dodge explosions to uncover a hidden treasure. The streets are filled with chaos as the fire spreads,
  and every step you take brings you closer to danger. Time is running out,
  and only your courage can guide you to the treasure that holds the key to salvation ",

  "Fight in a futuristic arena, wielding an energy sword against robotic opponents. The battle intensifies as the arena shifts,
  creating new challenges and hazards. Every strike brings you closer to victory,
  but beware — the machines are learning from your every move, and the stakes grow higher with each passing moment.",

  "An intense chase in flying vehicles through a sprawling metropolis suspended in the clouds.
  The city twists and turns as you navigate through towering skyscrapers, dodging obstacles and enemies. With every near miss,
  the stakes rise, and the pressure to escape grows as the skyline shatters around you",

  "Infiltrate a hidden base deep within a dense jungle, where every step could trigger a deadly trap.
  The sounds of wildlife echo through the trees as you carefully navigate through the undergrowth. Danger lurks around every corner,
  and you must rely on your instincts to survive and uncover the secrets hidden in the heart of the jungle.",

  "You step onto the stage of a prestigious award ceremony, hailed for your exceptional talent.
  The crowd erupts in applause as the spotlight shines on you, and the weight of the moment fills the air. As you stand there,
  the realization sinks in that this is the culmination of years of hard work and dedication to your craft.",

  "Climb the steps of a symbolic tower, where each floor represents a major success in your life.
  As you ascend, memories of past victories flash before your eyes, fueling your determination to reach the top.
  With every floor, you gain confidence, knowing that the pinnacle of your achievements is just within reach.",

  "A lavish evening celebrates you for accomplishing a groundbreaking financial feat.
  The world’s most influential figures gather to honor your success, and the spotlight is on you.
  As the applause echoes, you reflect on the journey that brought you here,
  realizing that this moment marks the beginning of even greater achievements",

  "You inaugurate a global foundation in your honor, your portrait etched in history.
  The world watches as you make a lasting impact, laying the groundwork for future generations.
  As you stand at the podium, you reflect on your journey, knowing that this legacy will forever change the world.",

  "Embark on a journey across the cosmos, navigating through star clusters and cosmic dust, with an ancient artifact that could change the fate of galaxies.
  As you travel, you'll encounter mysterious alien civilizations that hold the key to unlocking the artifact's true power.
  Every decision could alter the destiny of countless worlds, and time itself may be your greatest enemy.",

  "Dive into the deepest oceans where ancient civilizations lie beneath the waves.
  Explore sunken cities and decipher cryptic messages from the past, all while avoiding the lurking dangers of the abyss.
  Beneath the water's surface, strange creatures that defy human understanding roam freely, guarding treasures long forgotten.
  But be warned: the deeper you go, the more you risk losing yourself to the haunting whispers of the ocean's depths.",

  "Walk through a timeless forest where each step echoes through dimensions. Uncover the secrets of an eternal world, where the past and future collide and reality bends around you.
  As you journey deeper into the forest, you’ll encounter spectral beings who have transcended time and space, offering cryptic wisdom or dark warnings.
  The further you explore, the more you realize that this forest exists outside of time, where your past and future are waiting to meet.",

  "Wander through a futuristic city where towering skyscrapers shine with brilliant lights, but in the hidden alleys,
  darkness and mystery lurk. Choose whether to uncover its secrets or remain a mere observer.
  The city is filled with both technological marvels and hidden dangers, where underground movements fight for control of the city's future.
  As you delve into the shadows, you’ll face choices that could either bring enlightenment or plunge the city into chaos."
 ]

TITLES = ["Inferno's Run", "Blade Clash", "Skyfall Pursuit", "Jungle Ambush", "The Golden Stage", "Tower of Triumph",
  "Millionaire's Gala", "Legacy Creator", "Nebula Voyager", "Whispers in the Abyss", "Echoes of Eternity", "City of Light and Shadows"]


  URLS1 = ['https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220347/dream_1_mo9inl.png','https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220348/dream_2_o6fn83.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220348/dream_3_balmwi.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220348/dream_4_i2vpx8.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220349/dream_5_aqchoj.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220348/dream_6_dtgtts.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220350/dream_7_sopwt0.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220350/dream_8_mrnbh7.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220350/dream_9_szfjbs.jpg', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220351/dream_10_p3vgpc.jpg', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220352/dream_11_pgcciz.jpg', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732220351/dream_12_xaabgl.jpg']
  URLS2 = ['https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223577/dream_1_2_pcvrsn.webp', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223578/dream_2_2_wvmmxy.webp', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223578/dream_2_3_vq1g9w.webp', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223579/dream_4_2_hxzhcg.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223582/dream_5_2_hcpp5c.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223584/dream_6_2_y8mgcg.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223585/dream_7_2_fj5e2e.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223583/dream8_2_fftksk.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223580/dream_9_2_afhse5.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223580/dream_10_2_qwr1b8.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223581/dream_11_2_jyaqsd.png', 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732223582/dream_12_2_dz6zcv.png']

antou = User.create!(email: "antoine@dream.fr", password: "123456", nickname: "antou")

mik = User.create!(email: "mik@dream.fr", password: "123456", nickname: "mikmik")

taib = User.create!(email: "taib@dream.fr", password: "123456", nickname: "taibinho")

carlos = User.create!(email: "carlo@dream.fr", password: "123456", nickname: "carlos")


8.times do |i|
      dream = Dream.create!(
        title: TITLES[i],
        description: DESCS[i] ,
        price_per_night: rand(25..100),
        category: ["Action", "Success", "Lust", "Dreamy", "Adventure", "Travel", "Fantasy", "Time traveler"].sample,
        age_limit: [12, 16, 18].sample,
        number_of_roles: rand(1..4) ,
        user: [antou, taib, carlos, mik].sample,
        fav_status: false
      )

    image_path3 = URLS1[i]  # Vous devez remplacer cela par un chemin valide
    file_photo3 = URI.open(image_path3)

    image_path4 = URLS2[i]  # Vous devez remplacer cela par un chemin valide
    file_photo4 = URI.open(image_path4)

    # Associez l'image à votre objet `dream`
    dream.photos.attach(io: file_photo3, filename: "dream##{i+1}.png", content_type: "image/png")
    dream.photos.attach(io: file_photo4, filename: "dream##{i+1}#2.png", content_type: "image/png")


    puts "Created Dream: #{dream.title}"
  end
puts "finished"

4.times do |j|
  dream = Dream.create!(
    title: TITLES[j+8],
    description: DESCS[j+8] ,
    category: ["Action", "Success", "Lust", "Dreamy", "Adventure", "Travel", "Fantasy", "Time traveler"].sample,
    price_per_night: rand(25..100),
    age_limit: [12, 16, 18].sample,
    number_of_roles: rand(1..4) ,
    user: [antou, taib, carlos, mik].sample,
    fav_status: false
  )



  image_path1 = URLS1[j+8]  # Vous devez remplacer cela par un chemin valide
    file_photo1 = URI.open(image_path1)

    image_path2 = URLS2[j+8]  # Vous devez remplacer cela par un chemin valide
    file_photo2 = URI.open(image_path2)

    # Associez l'image à votre objet `dream`
    dream.photos.attach(io: file_photo1, filename: "dream##{j+9}.png", content_type: "image/png")
    dream.photos.attach(io: file_photo2, filename: "dream##{j+9}#2.png", content_type: "image/png")

  puts "Created Dream: #{dream.title}"
end

dream13 = Dream.create!(
  title: 'Coding Regex Nightmare',
  description: "You find yourself in a coding bootcamp, The Wagon, on a public holiday, but the pace is relentless. It's a 7-hour live coding session focused on Regex, and your windows are closed to avoid distractions. Despite the holiday, even the \"Master Poulet\" is fully immersed in the grind. As the day drags on, the pressure intensifies, and you realize that your Heroku account has just been charged $2,000. It's a nightmare of code, errors, and unexpected costs, yet the only option is to keep coding through it all." ,
  category: "Nightmare",
  price_per_night: 30,
  age_limit: 18,
  number_of_roles: 4 ,
  user: taib,
  fav_status: false
)

url_1_dream_13 = 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732232010/dream_13_1_q4pq1g.png'
url_2_dream_14 = 'https://res.cloudinary.com/dhwtnnav8/image/upload/v1732232010/dream_13_2_lwt8su.png'

image_path13 = url_1_dream_13  # Vous devez remplacer cela par un chemin valide
file_photo13 = URI.open(image_path13)

image_path14 = url_2_dream_14  # Vous devez remplacer cela par un chemin valide
file_photo14 = URI.open(image_path14)

dream13.photos.attach(io: file_photo13, filename: "dream#13#1.png", content_type: "image/png")
dream13.photos.attach(io: file_photo14, filename: "dream#13#2.png", content_type: "image/png")
