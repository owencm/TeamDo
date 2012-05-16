# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(first: 'Owen', last: 'Campbell-Moore', email: 'owencmoore@gmail.com', username: 'owencm', password: 'password')
tasks = Task.create([{title: 'Do this thing', description: 'Because I said so', setter: 1}, {title: 'Do another thing', description: 'Again. I told you', setter: 1}])
