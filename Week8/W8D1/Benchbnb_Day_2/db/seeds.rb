# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Bench.create!(
  description: "Comfy Turquoise Sand Bench",
  lat: 37.773,
  lng: -122.423,
)

Bench.create!(
  description: 'UN plaza, food truck access',
  lat: 37.779760,
  lng: -122.413820
)

Bench.create!(
  description: 'Ocean Beach, gnarly breh',
  lat: 37.769996,
  lng: -122.511281
)
