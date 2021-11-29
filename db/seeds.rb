# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'
require 'faker'
require 'json'

UserActivity.destroy_all
Activity.destroy_all
User.destroy_all
Sport.destroy_all
Category.destroy_all


puts 'database cleaned'

# url = "https://www.woodwardenglish.com/lesson/sports-in-english/"
# html_file = URI.open(url).read
# html_doc = Nokogiri::HTML(html_file)
# sports = []
# html_doc.search('.entry-content').each do |element|
#   element.search('li').each do |item|
#     sports << item.text.strip
#   end
# end

#Users
nicolas = User.create!(email: "nicolas@hotmail.com", password: "123456", nickname: 'Nicolas')
adonis = User.create!(email: "adonis@hotmail.com", password: "123456", nickname: 'Adonis')
filip = User.create!(email: "filip.brouwers@gmail.com", password: "123123", nickname: 'Filip')
thibaut = User.create!(email: "thibautbutaye@gmail.com", password: "123123", nickname: 'Thibbe')
file = URI.open('https://media.fashionnetwork.com/cdn-cgi/image/fit=contain,width=1000,height=1000/m/0d2f/313d/73c9/143a/6875/d46e/d976/bb81/2b1d/b017/b017.jpg')
nicolas.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

25.times do
  User.create(email: Faker::Internet.email, password: "123456", nickname: Faker::Name.name)
end


# Categories
['Ball', 'Endurance', 'Indoor', 'Outdoor', 'Strength', 'Water'].each do |category|
  Category.create(name: category)
end

allsports = ["archery", "athletics", "badminton", "baseball", "basketball", "BMX racing", "boxing", "chess", "shooting", "cricket", "cycling", "diving", "mountain biking", "equestrian", " hockey", " skating", "football", "golf", "gymnastics", "horse racing", "ice hockey", "jogging", "judo", "karate", "kayaking", "paintball", "polo", "billiards", "rafting", "rock climbing", "rugby", "running", "sailing", "skiing", "ski jumping", "snowboarding", "softball", "squash", "sumo wrestling", "surfing", "swimming", "table tennis", "tennis", "tenpin bowling", "trampolining", "triathlon", "volleyball", "water polo", "weightlifting"]
ball = ["baseball", "basketball", "football", "paintball", "softball", "volleyball"]
endurance = ["cycling", "jogging", "rafting", "running", "swimming", "triathlon"]
combat = ["boxing", "judo", "karate", "sumo wrestling"]
indoor = ["gymnastics", "trampolining"]
outdoor = ["jogging", "athletics", "triathlon"]


# Sports
allsports = ["athletics", "badminton", "baseball", "basketball", "boxing", "cycling", "hockey", "skating", "football", "golf", "judo", "karate", "rafting", "rugby", "running", "skiing", "surfing", "swimming", "tennis", "triathlon", "volleyball", "taekwondo", "kung fu"]
ball = ["baseball", "basketball", "football", "volleyball"]
endurance = ["cycling", "rafting", "running", "swimming", "triathlon"]
combat = ["boxing", "judo", "karate", "taekwondo", "kung fu"]
indoor = ["athletics", "badminton", "basketball", "boxing", "skating", "football", "judo", "karate", "swimming", "tennis", "volleyball"]
outdoor = ["athletics", "baseball", "basketball", "cycling", "hockey", "skating", "football", "golf", "rafting", "rugby", "running", "skiing", "surfing", "tennis", "triathlon"]


p athletics = Sport.create(kind: 'athletics', category: Category.all.sample)
athletics.photo.attach(io: URI.open('https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'), filename: 'athletics.png', content_type: 'athletics/png')
badminton = Sport.create(kind: 'badminton', category: Category.all.sample)
badminton.photo.attach(io: URI.open('https://images.unsplash.com/photo-1626224583764-f87db24ac4ea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmFkbWludG9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

baseball = Sport.create(kind: 'baseball', category: Category.all.sample)
baseball.photo.attach(io: URI.open('https://images.unsplash.com/photo-1573352362077-dd9ed1670845?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGJhc2ViYWxsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

basketball = Sport.create(kind: 'basketball', category: Category.all.sample)
basketball.photo.attach(io: URI.open('https://images.unsplash.com/photo-1608245449230-4ac19066d2d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),filename: 'athletics.png', content_type: 'athletics/png')

p boxing = Sport.create(kind: 'boxing', category: Category.all.sample)
boxing.photo.attach(io: URI.open('https://images.unsplash.com/photo-1618517048289-4646902edaf5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),filename: 'athletics.png', content_type: 'athletics/png')

cycling = Sport.create(kind: 'cycling', category: Category.all.sample)
cycling.photo.attach(io: URI.open('https://images.unsplash.com/photo-1444491741275-3747c53c99b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3ljbGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

hockey = Sport.create(kind: 'hockey', category: Category.all.sample)
hockey.photo.attach(io: URI.open('https://images.unsplash.com/photo-1567066245527-7097def64260?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aG9ja2V5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

skating = Sport.create(kind: 'skating', category: Category.all.sample)
skating.photo.attach(io: URI.open('https://images.unsplash.com/photo-1566796195789-d5a59f97235b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2thdGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

football = Sport.create(kind: 'football', category: Category.all.sample)
football.photo.attach(io: URI.open('https://images.unsplash.com/photo-1560272564-c83b66b1ad12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vdGJhbGx8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

golf = Sport.create(kind: 'golf', category: Category.all.sample)
golf.photo.attach(io: URI.open('https://images.unsplash.com/photo-1593282153762-a41e3cceb06c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z29sZnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

judo = Sport.create(kind: 'judo', category: Category.all.sample)
judo.photo.attach(io: URI.open('https://images.unsplash.com/photo-1603210185603-57fc717c4456?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8anVkb3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

karate = Sport.create(kind: 'karate', category: Category.all.sample)
karate.photo.attach(io: URI.open('https://images.unsplash.com/photo-1577998555981-6e798325914e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8a2FyYXRlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

rafting = Sport.create(kind: 'rafting', category: Category.all.sample)
rafting.photo.attach(io: URI.open('https://images.unsplash.com/photo-1594026634827-fe99c0a22e83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFmdGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

p rugby = Sport.create(kind: 'rugby', category: Category.all.sample)
rugby.photo.attach(io: URI.open('https://images.unsplash.com/photo-1582547221270-75f62358c60c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fHJ1Z2J5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

running = Sport.create(kind: 'running', category: Category.all.sample)
running.photo.attach(io: URI.open('https://images.unsplash.com/photo-1571008887538-b36bb32f4571?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cnVubmluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

skiing = Sport.create(kind: 'skiing', category: Category.all.sample)
skiing.photo.attach(io: URI.open('https://images.unsplash.com/photo-1565992441121-4367c2967103?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2tpaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

p surfing = Sport.create(kind: 'surfing', category: Category.all.sample)
surfing.photo.attach(io: URI.open('https://images.unsplash.com/photo-1502680390469-be75c86b636f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3VyZmluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

swimming = Sport.create(kind: 'swimming', category: Category.all.sample)
swimming.photo.attach(io: URI.open('https://images.unsplash.com/photo-1530549387789-4c1017266635?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3dpbW1pbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

tennis = Sport.create(kind: 'tennis', category: Category.all.sample)
tennis.photo.attach(io: URI.open('https://images.unsplash.com/photo-1554068865-24cecd4e34b8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGVubmlzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

triathlon = Sport.create(kind: 'triathlon', category: Category.all.sample)
triathlon.photo.attach(io: URI.open('https://images.unsplash.com/photo-1628689529124-3e0db67e984c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8dHJpYXRobG9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

kung = Sport.create(kind: 'kung fu', category: Category.all.sample)
kung.photo.attach(io: URI.open('https://images.unsplash.com/photo-1470639425574-19736d045ab7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGt1bmclMjBmdXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

volleyball = Sport.create(kind: 'volleyball', category: Category.all.sample)
volleyball.photo.attach(io: URI.open('https://images.unsplash.com/photo-1521138054413-5a47d349b7af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dm9sbGV5YmFsbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')

taekwondo = Sport.create(kind: 'taekwondo', category: Category.all.sample)
taekwondo.photo.attach(io: URI.open('https://images.unsplash.com/photo-1617480348565-d60644e43fe3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dGFla3dvbmRvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),filename: 'athletics.png', content_type: 'athletics/png')


# indoor.each do |sport|
#   p Sport.create!(kind: sport, category_id: 4)
# end

# outdoor.each do |sport|
#   p Sport.create!(kind: sport, category_id: 5)
# end

# activity_id = 1
Activity.create!(
  localisation: '10 Cantersteen 1000 Bruxelles',
  user_id: nicolas.id,
  description: 'Running at Bois de la Cambre this evening at 6pm',
  sport_id: Sport.all.sample.id,
  date: Date.today + 3
)

# activity_id = 2
Activity.create!(
  localisation: '12 Rue du midi 1000 Bruxelles',
  user_id: filip.id,
  description: 'Anyone up to swim near Etterbeek ?',
  sport: Sport.all.sample,
  date: Date.today + 7
)


#Activity
courir = Activity.create!(
    localisation: '10 Cantersteen 1000 Bruxelles',
    user_id: nicolas.id,
    description: 'Running at Bois de la Cambre this evening at 6pm',
    sport_id: 1,
    level: rand(1..5),
    date: Date.today
  )

url = "https://raw.githubusercontent.com/EthanRBrown/rrad/master/addresses-us-100.json"
json = JSON.parse(URI.open(url).read)
result = json["addresses"]
result.first(20).each do |hash|
  address = "#{hash["address1"]}, #{hash["city"]}"
p Activity.create!(
    localisation: address,
    user_id: nicolas.id,
    description: Faker::Quote.famous_last_words,
    sport: Sport.all.sample,
    level: rand(1..5),
    date: Date.today + 2
  )
end

#user1= nicolas user 2= adonis ;; user3 =filip ;; user4= thibaut
UserActivity.create!(activity_id: 3, user_id: 2)
UserActivity.create!(activity_id: 3, user_id: 3)
UserActivity.create!(activity_id: 3, user_id: 1)
UserActivity.create!(activity_id: 4, user_id: 3)
UserActivity.create!(activity_id: 4, user_id: 2)
UserActivity.create!(activity_id: 4, user_id: 4)
UserActivity.create!(activity_id: 4, user_id: 1)
