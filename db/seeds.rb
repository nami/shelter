require 'csv'

zenkoku_file = 'zenkoku.csv'

puts 'Cleaning database...'
Hinanjyo.destroy_all
User.destroy_all
Comment.destroy_all
Post.destroy_all

puts 'Creating shelters...'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
CSV.foreach(zenkoku_file, csv_options) do |row|
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
  remote_photo_id_url: "https://cdn.japantimes.2xx.jp/wp-content/uploads/2016/04/p8-taiwanese-b-20160414.jpg",
  remote_avatar_url: "https://cdn.japantimes.2xx.jp/wp-content/uploads/2016/04/p8-taiwanese-b-20160414.jpg"
  )

user.likes Hinanjyo.find(63378)

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

user.likes Hinanjyo.find(63378)


# PRESENTER PROFILE
User.create!(
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

user = User.create!(
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

user.likes Hinanjyo.find(63378)

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

#-----------------------------
#FAKE USERS
#-----------------------------
# User 6
  user = User.create!(
  first_name: "Aika",
  last_name: "Matsumoto",
  email: "aikamatsumoto@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sei: "松本", # last name
  mei: "愛果", # first name
  sei_kana: "マツモト",
  mei_kana: "アイカ",
  role: "Needs Help",
  phone: "42 69 66 88 15",
  address: "〒606-8314 京都府京都市左京区吉田下大路町２２",
  verified: true,
  remote_photo_id_url: "https://www.themasculinetraveler.com/wp-content/uploads/2019/01/japanese-woman-0.jpg",
  remote_avatar_url: "https://www.themasculinetraveler.com/wp-content/uploads/2019/01/japanese-woman-0.jpg"
  )

  user.likes Hinanjyo.find(63378)

# User 7
user = User.create!(
  first_name: "Kie",
  last_name: "Yamamoto",
  email: "kieyamamoto@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sei: "山本", # last name
  mei: "北乃", # first name
  sei_kana: "ヤマモト",
  mei_kana: "キエ",
  role: "Needs Help",
  phone: "42 69 66 88 16",
  address: "〒612-0882 京都府京都市伏見区深草藪之内町68",
  verified: true,
  remote_photo_id_url: "https://dvqlxo2m2q99q.cloudfront.net/000_clients/657152/file/657152W1F5xmih.jpg",
  remote_avatar_url: "https://dvqlxo2m2q99q.cloudfront.net/000_clients/657152/file/657152W1F5xmih.jpg"
  )

  user.likes Hinanjyo.find(63378)

# User 8
user = User.create!(
  first_name: "Takayuki",
  last_name: "Yamada",
  email: "yakayukiyamada@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sei: "山田", # last name
  mei: "孝之", # first name
  sei_kana: "ヤマダ",
  mei_kana: "タカユキ",
  role: "Needs Help",
  phone: "42 69 66 88 17",
  address: "〒601-8327 京都府京都市南区吉祥院御池町31番地",
  verified: true,
  remote_photo_id_url: "https://m.media-amazon.com/images/M/MV5BMTk3NjY2MjAwNF5BMl5BanBnXkFtZTcwMTQ1MDExOA@@._V1_.jpg",
  remote_avatar_url: "https://m.media-amazon.com/images/M/MV5BMTk3NjY2MjAwNF5BMl5BanBnXkFtZTcwMTQ1MDExOA@@._V1_.jpg"
  )

  user.likes Hinanjyo.find(63378)

 # Nami NGO User 9
  User.create!(
  first_name: "Ark",
  last_name: "Animal Refuge",
  email: "arkbark@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  sei: "アニマル・レフュージ", # last name
  mei: "アーク", # first name
  sei_kana: "アニマル・レフュージ",
  mei_kana: "アーク",
  role: "Helper",
  phone: "42 69 66 88 18",
  address: "595 Noma Ohara, Nose-cho, Toyono-gun, Osaka-fu 563-0131 JAPAN",
  verified: true,
  remote_photo_id_url: "http://www.arkbark.net/en/img/common/h_ark_logo.png",
  remote_avatar_url: "http://www.arkbark.net/en/img/common/h_ark_logo.png"
  )

  puts "Finished generating users..."
  puts "Generating Posts and Likes"
  post = Post.create!(
    title: "Need Help! No food",
    description: "I have no food currently but plenty of water. Would appreciate any help!!!!",
    user_id: 1,
    hinanjyo_id: 63378,
    tag_list: "Food"
    )

  User.find(2).likes post
  User.find(4).likes post
  User.find(5).likes post
  User.find(6).likes post

  post = Post.create!(
    title: "Help My Dog!",
    description: "I need someone to care for my dog as my shelter doesn't allow pets. He is well trained Shiba Inu named Pochi. Please help me as they only give me a week until they kick him out!",
    user_id: 6,
    hinanjyo_id: 63378,
    tag_list: "Other"
    )

  User.find(2).likes post
  User.find(4).likes post
  User.find(5).likes post
  User.find(7).likes post
  User.find(8).likes post

  post = Post.create!(
    title: "Diapers for my Baby",
    description: "My baby is in need of diapers urgently! I only have a few left!",
    user_id: 7,
    hinanjyo_id: 63378,
    tag_list: "Baby/Kid"
    )

  User.find(2).likes post


  post= Post.create!(
    title: "Requesting clothes",
    description: "I have no good clothing to wear",
    user_id: 2,
    hinanjyo_id: 63378,
    tag_list: "Clothing"
    )

  User.find(6).likes post
  User.find(7).likes post
  User.find(8).likes post

  post = Post.create!(
    title: "Need Help! Medicine",
    description: "I really need medicine for my allergies!!!!",
    user_id: 6,
    hinanjyo_id: 63378,
    tag_list: "Medicine"
    )

  User.find(4).likes post
  User.find(5).likes post
  User.find(6).likes post
  User.find(7).likes post


  post = Post.create!(
    title: "Running low on fuel",
    description: "In need of fuel for heating!",
    user_id: 4,
    hinanjyo_id: 63378,
    tag_list: "Fuel"
    )

  User.find(2).likes post
  User.find(4).likes post

  post = Post.create!(
    title: "Need Help! Soap",
    description: "I have run out of soap!!!!",
    user_id: 8,
    hinanjyo_id: 63378,
    tag_list: "Other"
    )

  User.find(2).likes post
  User.find(4).likes post

  puts "Posts and Likes created"
  puts "Creating Comments..."

  Comment.create!(
    post_id: 1,
    user_id: 2,
    content: "I have plenty of canned food to give you but you will need to cook it yourself! I can make my way there within the next few hours"
    )

  Comment.create!(
    post_id: 1,
    user_id: 1,
    content: "You are a life saver!!! Literally!!!! Thank you :)"
    )

  Comment.create!(
    post_id: 1,
    user_id: 2,
    content: "Running a bit late but still on my way!"
    )

  Comment.create!(
    post_id: 1,
    user_id: 1,
    content: "No problem! Thanks so much once again"
    )

    Comment.create!(
    post_id: 4,
    user_id: 6,
    content: "Bringing some!"
    )

   Comment.create!(
    post_id: 4,
    user_id: 3,
    content: "Bringing some!"
    )

    Comment.create!(
    post_id: 4,
    user_id: 2,
    content: "Thank you! I will be outside"
    )


  Comment.create!(
    post_id: 6,
    user_id: 7,
    content: "Bringing some!"
    )

  puts "Comments completed"
