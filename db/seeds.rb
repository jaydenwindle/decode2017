# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
giveaway = Giveaway.new(
  :store => 1,
  :products => {"a" => 1, "b"=>2}.to_json,
  :description => "some desc",
  :name => "some name",
  :isActive => true
)
giveaway.save
