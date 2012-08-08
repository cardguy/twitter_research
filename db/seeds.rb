# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create! do |user|
  user.email                 = "foobar@test.com"
  user.password              = 'foobar'
  user.password_confirmation = 'foobar'
end

Category.create!(title: 'Gaga')
Category.create!(title: 'R&B')
Category.create!(title: 'Tech')
Category.create!(title: 'Politics')
Category.create!(title: 'Weather')
