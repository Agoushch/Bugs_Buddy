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

# Categories
ball_cat = Category.create(name: 'Ball')
endurance_cat = Category.create(name: 'Endurance')
combat_cat = Category.create(name: 'Combat')
indoor_cat = Category.create(name: 'Indoor')
outdoor_cat = Category.create(name: 'Outdoor')


# Sports
allsports = ["athletics", "badminton", "baseball", "basketball", "boxing", "cycling", "hockey", "skating", "football", "golf", "judo", "karate", "rafting", "rugby", "running", "skiing", "surfing", "swimming", "tennis", "triathlon", "volleyball", "taekwondo", "kung fu"]
ball = ["baseball", "basketball", "football", "volleyball"]
endurance = ["cycling", "rafting", "running", "swimming", "triathlon"]
combat = ["boxing", "judo", "karate", "taekwondo", "kung fu"]
indoor = ["athletics", "badminton", "basketball", "boxing", "skating", "football", "judo", "karate", "swimming", "tennis", "volleyball"]
outdoor = ["athletics", "baseball", "basketball", "cycling", "hockey", "skating", "football", "golf", "rafting", "rugby", "running", "skiing", "surfing", "tennis", "triathlon"]
indoor.each do |sport|
  p Sport.create!(kind: sport, category: indoor_cat)
end
outdoor.each do |sport|
  p Sport.create!(kind: sport, category: outdoor_cat)
end
ball.each do |sport|
  p Sport.create!(kind: sport, category: ball_cat)
end
endurance.each do |sport|
  p Sport.create!(kind: sport, category: endurance_cat)
end
combat.each do |sport|
  p Sport.create!(kind: sport, category: combat_cat)
end

# Users
nicolas = User.create(email: "nicolas@hotmail.com", password: "123456", nickname: 'Nicolas')
adonis = User.create(email: "adonis@hotmail.com", password: "123456", nickname: 'Adonis')

#Activity
courir = Activity.create!(
    localisation: '10 Cantersteen 1000 Bruxelles',
    user_id: nicolas.id,
    description: 'Running at Bois de la Cambre this evening at 6pm',
    sport_id: 1,
    date: Date.today
  )

url = "https://raw.githubusercontent.com/EthanRBrown/rrad/master/addresses-us-100.json"
json = JSON.parse(URI.open(url).read)
result = json["addresses"]
result.first(20).each do |hash|
  address = "#{hash["address1"]}, #{hash["city"]}"
p Activity.create!(
    localisation: address,
    user: nicolas,
    description: Faker::Quote.famous_last_words,
    sport: Sport.all.sample,
    date: Date.today
  )
end

#Useractivity
nicolas_act = UserActivity.create(activity: courir, user_id: nicolas.id)
