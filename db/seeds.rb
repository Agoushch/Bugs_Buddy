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

nicolas = User.create!(email: "nicolas@hotmail.com", password: "123456", nickname: 'Nicolas')
adonis = User.create!(email: "adonis@hotmail.com", password: "123456", nickname: 'Adonis')
filip = User.create!(email: "filip.brouwers@gmail.com", password: "123123", nickname: 'Filip')
thibaut = User.create!(email: "thibautbutaye@gmail.com", password: "123123", nickname: 'Thibbe')

ball_cat = Category.create(name: 'Ball')
endurance_cat = Category.create(name: 'Endurance')
combat_cat = Category.create(name: 'Combat')
indoor_cat = Category.create(name: 'Indoor')
outdoor_cat = Category.create(name: 'Outdoor')

allsports = ["archery", "athletics", "badminton", "baseball", "basketball", "BMX racing", "boxing", "chess", "shooting", "cricket", "cycling", "diving", "mountain biking", "equestrian", " hockey", " skating", "football", "golf", "gymnastics", "horse racing", "ice hockey", "jogging", "judo", "karate", "kayaking", "paintball", "polo", "billiards", "rafting", "rock climbing", "rugby", "running", "sailing", "skiing", "ski jumping", "snowboarding", "softball", "squash", "sumo wrestling", "surfing", "swimming", "table tennis", "tennis", "tenpin bowling", "trampolining", "triathlon", "volleyball", "water polo", "weightlifting"]
ball = ["baseball", "basketball", "football", "paintball", "softball", "volleyball"]
endurance = ["cycling", "jogging", "rafting", "running", "swimming", "triathlon"]
combat = ["boxing", "judo", "karate", "sumo wrestling"]
indoor = ["gymnastics", "trampolining"]
outdoor = ["jogging", "athletics", "triathlon"]

ball.each do |sport|
  p Sport.create!(kind: sport, category_id: 1)
end

endurance.each do |sport|
  p Sport.create!(kind: sport, category_id: 2)
end

combat.each do |sport|
  p Sport.create!(kind: sport, category_id: 3)
end

indoor.each do |sport|
  p Sport.create!(kind: sport, category_id: 4)
end

outdoor.each do |sport|
  p Sport.create!(kind: sport, category_id: 5)
end

# activity_id = 1
Activity.create!(
  localisation: '10 Cantersteen 1000 Bruxelles',
  user: nicolas,
  description: 'Running at Bois de la Cambre this evening at 6pm',
  sport_id: 10,
  date: Date.today + 3
)

# activity_id = 2
Activity.create!(
  localisation: '12 Rue du midi 1000 Bruxelles',
  user: filip,
  description: 'Anyone up to swim near Etterbeek ?',
  sport: Sport.all.sample,
  date: Date.today + 7
)

url = "https://raw.githubusercontent.com/EthanRBrown/rrad/master/addresses-us-100.json"
json = JSON.parse(URI.open(url).read)
result = json["addresses"]
result.first(10).each do |hash|
  address = "#{hash["address1"]}, #{hash["city"]}"
p Activity.create!(
    localisation: address,
    user: nicolas,
    description: Faker::Quote.famous_last_words,
    sport: Sport.all.sample,
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

# adonis_ act = UserActivity.create(activity: courir, user_id: 2)
