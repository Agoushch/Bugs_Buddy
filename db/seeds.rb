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

file = URI.open('https://images.mubicdn.net/images/cast_member/2552/cache-207-1524922850/image-w856.jpg?size=800x')
nicolas = User.create!(email: "nicolas@hotmail.com", password: "123456", nickname: 'Nicolas')
nicolas.photo.attach(io: file, filename: 'nicolas.png', content_type: 'image/png')
nicolas.save!


adonis = User.create(email: "adonis@hotmail.com", password: "123456", nickname: 'Adonis')


categories = ['Indoor', 'Outdoor', 'Strength', 'Fitness']

categories.each do |category|
  Category.create(name: category)
end

ball_cat = Category.create(name: 'Ball')
endurance_cat = Category.create(name: 'Endurance')
combat_cat = Category.create(name: 'Combat')

allsports = ["archery", "athletics", "badminton", "baseball", "basketball", "BMX racing", "boxing", "chess", "shooting", "cricket", "cycling", "diving", "mountain biking", "equestrian", " hockey", " skating", "football", "golf", "gymnastics", "horse racing", "ice hockey", "jogging", "judo", "karate", "kayaking", "paintball", "polo", "billiards", "rafting", "rock climbing", "rugby", "running", "sailing", "skiing", "ski jumping", "snowboarding", "softball", "squash", "sumo wrestling", "surfing", "swimming", "table tennis", "tennis", "tenpin bowling", "trampolining", "triathlon", "volleyball", "water polo", "weightlifting"]
ball = ["baseball", "basketball", "football", "paintball", "softball", "volleyball"]
endurance = ["cycling", "jogging", "rafting", "running", "swimming", "triathlon"]
combat = ["boxing", "judo", "karate", "sumo wrestling"]



ball.each do |sport|
  p Sport.create!(kind: sport, category: ball_cat)
end

endurance.each do |sport|
  p Sport.create!(kind: sport, category: endurance_cat)
end

combat.each do |sport|
  p Sport.create!(kind: sport, category: combat_cat)
end


running = Sport.create(kind: 'running')

courir = Activity.create!(
    localisation: '10 Cantersteen 1000 Bruxelles',
    user_id: nicolas.id,
    description: 'Running at Bois de la Cambre this evening at 6pm',
    sport_id: 1,
    date: Date.today
  )

nager = Activity.create!(
    localisation: '12 Rue du midi 1000 Bruxelles',
    user_id: nicolas.id,
    description: 'Anyone up to swim near Etterbeek ?',
    sport: Sport.all.sample,
    date: Date.today
  )

url = "https://raw.githubusercontent.com/EthanRBrown/rrad/master/addresses-us-100.json"
json = JSON.parse(URI.open(url).read)
result = json["addresses"]
result.first(5).each do |hash|
  address = "#{hash["address1"]}, #{hash["city"]}"
p Activity.create!(
    localisation: address,
    user_id: nicolas.id,
    description: Faker::Quote.famous_last_words,
    sport: Sport.all.sample,
    date: Date.today
  )
end

nicolas_run= UserActivity.create(activity: courir, user_id: nicolas.id)

adonis_run = UserActivity.create(activity: courir, user_id: adonis.id)
