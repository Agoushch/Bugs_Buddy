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


allsports = ["archery", "athletics", "badminton", "baseball", "basketball", "BMX racing", "boxing", "chess", "shooting", "cricket", "cycling", "diving", "mountain biking", "equestrian", " hockey", " skating", "football", "golf", "gymnastics", "horse racing", "ice hockey", "jogging", "judo", "karate", "kayaking", "paintball", "polo", "billiards", "rafting", "rock climbing", "rugby", "running", "sailing", "skiing", "ski jumping", "snowboarding", "softball", "squash", "sumo wrestling", "surfing", "swimming", "table tennis", "tennis", "tenpin bowling", "trampolining", "triathlon", "volleyball", "water polo", "weightlifting"]
allsports.each do |sport|
  newsport = Sport.create!(kind: sport)
  p newsport
end

categories = ['Ball', 'Indoor', 'Outdoor', 'Endurance', 'Strength', 'Combat', 'Fitness']

random_sports = categories.shuffle
Sport.all.each do |sport|
    sport.update(category: random_sports.sample)
    sport.save
    p sport
end

# curling = Sport.create(kind: 'curling')
# nicolas = User.create(email: "nicolas@hotmail.com", password: "123456", nickname: 'Nicolas')

# url = "https://raw.githubusercontent.com/EthanRBrown/rrad/master/addresses-us-100.json"
# json = JSON.parse(URI.open(url).read)
# result = json["addresses"]
# result.each do |hash|
#   address = "#{hash["address1"]}, #{hash["city"]}"
#   activity = Activity.create!(
#     localisation: address,
#     user: nicolas,
#     description: Faker::Quote.famous_last_words,
#     sport: curling,
#     date: Date.today
#   )
#   p activity
# end
