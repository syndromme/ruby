# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([ {:first_name => "Agus", :last_name => "Rustandi", :email => "agus.rusty3@gmail.com", :username => "ru5ty", :address => "Majalaya", :age => 22, :birthday => "08/22/1990"}, {:first_name => "Iman", :last_name => "Suparman", :email => "tekomc.dan@gmail.com", :username => "micah", :address => "Banjaran", :age => 24}, {:first_name => "Mohammad", :last_name => "Dwikuntobayu", :email => "mdwikuntobayu@gmail.com", :username => "kunto", :address => "Bandung", :age => 22}, {:first_name => "Ruby", :last_name => "ON RAILS", :email => "rubyonrails@gmail.com", :username => "ror", :address => "Japan", :age => 12}, {:first_name => "martin", :last_name => "only", :email => "martin@kiranatama.com", :username => "martin", :address => "Bandung", :age => 25}] )

countries = Country.create ([ {:code => "62", :name => "Indonesia"}, {:code => "63", :name => "Zimbabwe"}, {:code => "67", :name => "Thailand"}, {:code => "99", :name => "Mesir"}, {:code => "34", :name => "Malaysia"} ])

articles = Article.create ([ {:title => "Pembunuhan", :body => "Nyak kitu we pembunuhan mah"}, {:title => "Pencurian", :body => "Nyak kitu we pencurian mah"}, {:title => "Kecelakaan", :body => "Nyak kitu we kecelakaan mah"}, {:title => "Politik", :body => "Lier w lah"}, {:title => "Sepak bola", :body => "Juventini"}] )

comments = Comment.create ([ {:content => "Politik"}, {:content => "Olah raga"}, {:content => "Kriminal"}, {:content => "Gaya hidup"}, {:content => "Gossip"}] )
