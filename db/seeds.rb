# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

kyoto_file = 'kyoto_shelters.csv'
osaka_file = 'osaka_shelters.csv'

puts 'Cleaning database...'
Hinanjyo.destroy_all
User.destroy_all
Comment.destroy_all
Post.destroy_all

puts 'Creating Osaka shelters...'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
CSV.foreach(osaka_file, csv_options) do |row|
  t = Hinanjyo.new
  t.prefecture = row['prefecture']
  t.place_name = row['place_name']
  t.street = row['street']
  t.floods = row['floods']
  t.mudslides = row['mudslides']
  t.high_tides = row['high_tides']
  t.earthquakes = row['earthquakes']
  t.tsunami = row['tsunami']
  t.fire = row['fire']
  t.burst_pipe = row['burst_pipe']
  t.volcano = row['volcano']
  t.latitude = row['lat']
  t.longitude = row['long']
  t.save!
end

puts "There are now #{Hinanjyo.count} rows in the shelters table"

puts 'Creating Kyoto shelters...'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
CSV.foreach(kyoto_file, csv_options) do |row|
  t = Hinanjyo.new
  t.prefecture = row['prefecture']
  t.place_name = row['place_name']
  t.street = row['street']
  t.floods = row['floods']
  t.mudslides = row['mudslides']
  t.high_tides = row['high_tides']
  t.earthquakes = row['earthquakes']
  t.tsunami = row['tsunami']
  t.fire = row['fire']
  t.burst_pipe = row['burst_pipe']
  t.volcano = row['volcano']
  t.latitude = row['lat']
  t.longitude = row['long']
  t.save!
end
puts "There are now #{Hinanjyo.count} rows in the shelters table"

puts 'Finished! Shelters'

puts 'Creating Users....'
user = User.create!(
  first_name: "Peter",
  last_name: "Hsieh",
  email: "peterhsieh@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sei: "謝", # last name
  mei: "俊宏", # first name
  sei_kana: "シーエ",
  mei_kana: "ピーター",
  role: "Needs Help",
  phone: "42 69 66 88 11",
  address: "〒602-0898 Kyoto, Kamigyō-ku, 烏丸通上立売上る相国寺門前町699",
  verified: true,
  remote_photo_id_url: "https://avatars1.githubusercontent.com/u/43994166?s=460&v=4",
  remote_avatar_url: "https://avatars1.githubusercontent.com/u/43994166?s=460&v=4"
  )

user.likes Hinanjyo.find(1)

user = User.create!(
  first_name: "Aya",
  last_name: "Kyoto",
  email: "ayakyoto@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sei: "京都", # last name
  mei: "彩", # first name
  sei_kana: "キョウト",
  mei_kana: "アヤ",
  role: "Needs Help",
  phone: "42 69 66 88 12",
  address: "〒612-0029 京都府京都市伏見区深草西浦町８丁目８丁目１",
  verified: true,
  remote_photo_id_url: "https://avatars1.githubusercontent.com/u/46548452?s=460&v=4",
  remote_avatar_url: "https://avatars1.githubusercontent.com/u/46548452?s=460&v=4"
  )

user.likes Hinanjyo.find(199)

user = User.create!(
  first_name: "Nami",
  last_name: "Yagi",
  email: "namiyagi@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sei: "八木", # last name
  mei: "なみ", # first name
  sei_kana: "ヤギ",
  mei_kana: "ナミ",
  role: "Needs Help",
  phone: "050 1234 5678",
  address: "1-３２ Machikaneyamacho, Toyonaka, Osaka 560-0043",
  verified: true,
  remote_photo_id_url: "https://avatars3.githubusercontent.com/u/39056749?s=460&v=4",
  remote_avatar_url: "https://avatars3.githubusercontent.com/u/39056749?s=460&v=4"
  )

user.likes Hinanjyo.find(171)

User.create!(
  first_name: "Derek",
  last_name: "Johnson",
  email: "derekjohnson@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sei: "ジョンソン", # last name
  mei: "デレック", # first name
  sei_kana: "ジョンソン",
  mei_kana: "デレック",
  role: "Needs Help",
  phone: "42 69 66 88 13",
  address: "9-2 Saiinnishisanzōchō Ukyo Ward, Kyoto, 615-0027",
  verified: true,
  remote_photo_id_url: "https://avatars3.githubusercontent.com/u/47250714?s=460&v=4",
  remote_avatar_url: "https://avatars3.githubusercontent.com/u/47250714?s=460&v=4"
  )

user.likes Hinanjyo(199)

User.create!(
  first_name: "NGO",
  last_name: "Ethical",
  email: "ethicalngo@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sei: "エシカル", # last name
  mei: "エン・ジー・オー", # first name
  sei_kana: "エシカル",
  mei_kana: "エン・ジー・オー",
  role: "Helper",
  phone: "42 69 66 88 14",
  address: "〒601-8016 京都府京都市南区東九条烏丸町１−１",
  verified: true,
  remote_photo_id_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ80vPaDNSSHNUT_67JCeHgTj18BIDShFrB0RWTYSDkb_HmPHqS",
  remote_avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ80vPaDNSSHNUT_67JCeHgTj18BIDShFrB0RWTYSDkb_HmPHqS"
  )

# User.create!(
#   first_name: "NGO",
#   last_name: "Ethical",
#   email: "ethicalngo@gmail.com",
#   password: "123456",
#   password_confirmation: "123456",
#   sei: "エシカル", # last name
#   mei: "エン・ジー・オー", # first name
#   sei_kana: "エシカル",
#   mei_kana: "エン・ジー・オー",
#   role: "Helper",
#   phone: "42 69 66 88 14",
#   address: "〒601-8016 京都府京都市南区東九条烏丸町１−１",
#   verified: true,
#   remote_photo_id_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ80vPaDNSSHNUT_67JCeHgTj18BIDShFrB0RWTYSDkb_HmPHqS",
#   remote_avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ80vPaDNSSHNUT_67JCeHgTj18BIDShFrB0RWTYSDkb_HmPHqS"
#   )

  puts "Finished generating users..."

  Post.create(
    title: "Need Help! No food",
    description: "I have no food currently but plenty of water. Would appreciate any help!!!!",
    user_id: 1,
    photo: " ",
    hinanjyo_id: 1
    )

    Post.create(
    title: "Need Help! No food",
    description: "I have no food currently but plenty of water. Would appreciate any help!!!!",
    user_id: 1,
    photo: "",
    hinanjyo_id: 1
    )

  Post.create(
    title: "Need Diapers",
    description: "My baby is in need of diapers urgently!",
    user_id: 1,
    photo: "",
    hinanjyo_id: 1
    )

    Post.create(
    title: "Requesting clothes",
    description: "I have no good clothing to wear",
    user_id: 2,
    photo: "",
    hinanjyo_id: 199
    )

  Post.create(
    title: "Need Help! Medicine",
    description: "I really need medicine for my allergies!!!!",
    user_id: 3,
    photo: "",
    hinanjyo_id: 171
    )


  Post.create(
    title: "Running low on fuel",
    description: "In need of fuel for heating!",
    user_id: 3,
    photo: "",
    hinanjyo_id: 171
    )

  Post.create(
    title: "Need Help! Soap",
    description: "I have run out of soap!!!!",
    user_id: 4,
    photo: "",
    hinanjyo_id: 400
    )

  Comment.create(
    post_id: 1,
    user_id: 2,
    content: "I have plenty of canned food to give you but you will need to cook it yourself! I can make my way there within the next few hours",
    photo: " "
    )

  Comment.create(
    post_id: 1,
    user_id: 1,
    content: "You are a life saver!!! Literally!!!! Thank you :)",
    photo: " "
    )

  Comment.create(
    post_id: 1,
    user_id: 2,
    content: "Running a bit late but still on my way!",
    photo: " "
    )

  Comment.create(
    post_id: 1,
    user_id: 1,
    content: "No problem! Thanks so much once again",
    photo: " "
    )

    Comment.create(
    post_id: 4,
    user_id: 1,
    content: "Bringing some!",
    photo: " "
    )

   Comment.create(
    post_id: 4,
    user_id: 3,
    content: "Bringing some!",
    photo: " "
    )

    Comment.create(
    post_id: 4,
    user_id: 2,
    content: "Thank you! I will be outside",
    photo: " "
    )


  Comment.create(
    post_id: 6,
    user_id: 1,
    content: "Brining some!",
    photo: " "
    )
