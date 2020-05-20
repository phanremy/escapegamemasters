# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# the_game = Company.new(name:"The Game", address: "", website:"", description:"in progress")

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


# Epsilon
# hopital psychiatrique
# won
# 45min

# room rush
#
