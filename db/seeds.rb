# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ email: 'ngm170142@gwu.edu', password: 'ChangeMe1234'}, {email: 'brent11@gwu.edu', password: 'ChangeMe1234'}, {email: 'averyckrauss@gwu.edu', password: 'ChangeMe1234'}, {email: 'jburns@gwu.edu', password: 'ChangeMe1234'}])