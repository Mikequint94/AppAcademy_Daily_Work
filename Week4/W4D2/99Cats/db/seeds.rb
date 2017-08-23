# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

colors =  %w(black brown tabby ginger gray burgundy sandy white)
Cat.destroy_all
c1 = Cat.create!({ name: Faker::Cat.name, birth_date: '08/09/1994', color: colors.sample,
   sex: 'Q', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'})
c2 = Cat.create!({ name: Faker::Cat.name, birth_date: '08/09/1974', color: colors.sample,
   sex: 'M', description: 'Llolxxxxpariatur.'})
c3 = Cat.create!({ name: Faker::Cat.name, birth_date: '03/01/1994', color: colors.sample,
   sex: 'F', description: 'CUTEST CAT EVER!!!.'})
