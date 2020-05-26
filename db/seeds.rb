# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# the_game = Company.new(name:"The Game", address: "", website:"", description:"in progress")

# dummy users

User.create(first_name: "Rym", last_name: "Rem", password:"1234", email: "aa@gmail.com", location: "Paris")
User.create(first_name: "Come", last_name: "te", password:"1234", email: "bb@gmail.com", location: "Lognes")
User.create(first_name: "Val", last_name: "eri", password:"1234", email: "cc@gmail.com", location: "Noisiel")
User.create(first_name: "Mel", last_name: "Amouche", password:"1234", email: "dd@gmail.com", location: "Torcy")
User.create(first_name: "Kit", last_name: "Kat", password:"1234", email: "ee@gmail.com", location: "Lyon")
User.create(first_name: "Toda", last_name: "Lavida", password:"1234", email: "ff@gmail.com", location: "Nantes")
User.create(first_name: "Kev", last_name: "In", password:"1234", email: "gg@gmail.com", location: "Creteil")


### My game from the Game ###
# if Company.find_by(name: "The Game")
the_game = Company.new(name:"The Game", address: "51 Rue du Cardinal Lemoine, 75005 Paris", website:"https://www.thegame-france.com/", description:"in progress")
the_game.save

game_casino = Game.new(name:"Braquage de Casino")
game_casino.company = the_game

game_casino.save

game_francais = Game.new(name:"Braquage A La Francaise")
game_francais.company = the_game

game_francais.save


# Casino
# won
# 54:21



# Braquage a la francaise
# won

# end

# others

# Pirate
# Voyage dans le temps

# Rashomon Escape Game
# Braquage Musee
# won

rashomon = Company.new(name:"Rashomon", address: "26 Rue Breguet, 75011 Paris", website:"https://www.rashomon-escape.com/", description:"in progress")
rashomon.save

game_musee = Game.new(name:"Le Musee")
game_musee.company = rashomon

game_musee.save

game_braquage = Game.new(name:"Le Braquage")
game_braquage.company = rashomon

game_braquage.save


# Epsilon
# hopital psychiatrique
# won
# 45min

# room rush
#superette
#won
