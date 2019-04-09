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

puts 'Finished!'
