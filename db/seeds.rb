# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# the_game = Company.new(name:"The Game", address: "", website:"", description:"in progress")


def preliminary_seed
# dummy users
  User.create(first_name: "Rem", last_name: "Rem", password:"1234", email: "aa@gmail.com", location: "Paris")
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

  the_game = Company.new(name:"The Game", address: "51 Rue du Cardinal Lemoine, 75005 Paris", website:"https://www.thegame-france.com/", description:"in progress")
  the_game.save

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
end

def escape_companies
  # Rashomon and The Game is already in preliminary seed
  Company.create(name: "Gamescape", address: "17 Rue de la Pierre Levée, 75011 Paris", website: "https://www.gamescape.fr/", description: "in progress")
  Company.create(name: "Quest Factory", address: "4 Rue des Petits Hôtels, 75010 Paris", website: "https://www.questfactory.fr/", description: "in progress")
  Company.create(name: "Lock Academy - Académie Châtelet", address: "25 Rue Coquillière, 75001 Paris", website: "https://lockacademy.com/", description: "in progress")
  # Lock Academy Sebastopol is also existing, ignored
  Company.create(name: "Escape Game Paris Prizoners", address: "15 Rue Quincampoix, 75004 Paris", website: "https://www.prizoners.com/", description: "in progress")
  Company.create(name: "Phobia", address: "127 Rue Jeanne d'Arc, 75013 Paris", website: "https://escape-phobia.com/", description: "in progress")
  Company.create(name: "HintHunt", address: "62 Rue Beaubourg, 75003 Paris", website: "https://hinthunt.fr/", description: "in progress")
  Company.create(name: "Escape Hunt Paris", address: "5 rue d’Hanovre, 75002 Paris", website: "https://escapehunt.com/fr/paris/", description: "in progress")
  Company.create(name: "Victory Escape Game (IIIe arrondissement)", address: "37 Rue des Gravilliers, 75003 Paris", website: "http://www.victoryescapegame.fr/", description: "in progress")
  Company.create(name: "Leavinroom Escape game Paris", address: "28bis Boulevard Pereire, 75017 Paris", website: "https://leavinroom.fr/", description: "in progress")
  Company.create(name: "X-Dimension Entertainment Real Escape", address: "18 Avenue Parmentier, 75011 Paris", website: "http://www.x-dimension.fr/", description: "in progress")
  Company.create(name: "Majestic Escape Game", address: "2 Rue Française, 75001 Paris", website: "https://majestic-escapegame.paris/", description: "in progress")
  Company.create(name: "Victory Escape Game (IXe arrondissement)", address: "21 Rue de la Victoire, 75009 Paris", website: "http://www.victoryescapegame.fr/", description: "in progress")
  Company.create(name: "La Boîte - Escape Game Paris", address: "71 Boulevard Brune, 75014 Paris", website: "https://www.la-boite.net/", description: "in progress")
  Company.create(name: "Happy Hour Escape Game", address: "37 Rue de la Lune, 75002 Paris", website: "http://www.happyhourescapegame.com/", description: "in progress")
  Company.create(name: "Team Break - Escape Game Paris 9", address: "17 Rue des Martyrs, 75009 Paris", website: "https://www.team-break.fr/", description: "in progress")
  Company.create(name: "60 Minutes Escape Game Paris", address: "130 Rue du Faubourg Saint-Martin, 75010 Paris", website: "http://60escape.com/", description: "in progress")
  Company.create(name: "Crack The Egg Escape Game", address: "46 Avenue Daumesnil, 75012 Paris", website: "https://www.crack-the-egg.com/", description: "in progress")
  Company.create(name: "Tempête sous un crâne - Escape Game", address: "34 Rue des Bergers, 75015 Paris", website: "https://www.tempetesousuncrane.com/", description: "in progress")
  Company.create(name: "Room Rush", address: "100 Avenue Philippe-Auguste, 75011 Paris", website: "https://roomrush.fr/", description: "in progress")
  Company.create(name: "Epsilon", address: "137 Boulevard de Sébastopol, 75002 Paris", website: "https://epsilonescape.fr/", description: "in progress")
end



def the_game_escape_games
  the_game = Company.find_by(name:"The Game")
  Game.create(name:"Le Métro", company_id: the_game.id, description: "in progress")
  Game.create(name:"L'Enlèvement", company_id: the_game.id, description: "in progress")
  Game.create(name:"Les Catacombes", company_id: the_game.id, description: "in progress")
  Game.create(name:"Le Trésor des Templiers (Assassin's Creed)", company_id: the_game.id, description: "in progress")
  Game.create(name:"L'Avion'", company_id: the_game.id, description: "in progress")
  Game.create(name:"La Mission Spatiale", company_id: the_game.id, description: "in progress")
  Game.create(name:"Le Tremblement de Terre", company_id: the_game.id, description: "in progress")
end

def escape_games
  the_game = Company.find_by(name:"The Game")
  rashomon = Company.find_by(name:"Rashomon")
  gamescape = Company.find_by(name: "Gamescape")
  quest_factory = Company.find_by(name: "Quest Factory")
  lock_academy = Company.find_by(name: "Lock Academy - Académie Châtelet")
  prizoners = Company.find_by(name: "Escape Game Paris Prizoners")
  phobia = Company.find_by(name: "Phobia")
  hinthunt = Company.find_by(name: "HintHunt")
  hunt_paris = Company.find_by(name: "Escape Hunt Paris")
  victoryIII = Company.find_by(name: "Victory Escape Game (IIIe arrondissement)")
  leavinroom = Company.find_by(name: "Leavinroom Escape game Paris")
  x_dimension = Company.find_by(name: "X-Dimension Entertainment Real Escape")
  majestic = Company.find_by(name: "Majestic Escape Game")
  victoryIX = Company.find_by(name: "Victory Escape Game (IXe arrondissement)")
  boite = Company.find_by(name: "La Boîte - Escape Game Paris")
  happy_hour = Company.find_by(name: "Happy Hour Escape Game")
  team_break = Company.find_by(name: "Team Break - Escape Game Paris 9")
  sixtyminutes = Company.find_by(name: "60 Minutes Escape Game Paris")
  crack_the_egg = Company.find_by(name: "Crack The Egg Escape Game")
  tempete = Company.find_by(name: "Tempête sous un crâne - Escape Game")
  roomrush = Company.find_by(name:"Room Rush")
  epsilon = Company.find_by(name:"Epsilon")

  Game.create(name:"Le Crime", company_id: rashomon.id, description: "in progress")
  Game.create(name:"Le Pharaon", company_id: rashomon.id, description: "in progress")
  Game.create(name:"L'Ascenseur'", company_id: rashomon.id, description: "in progress")

  Game.create(name:"Le Cachot de la Bastille", company_id: gamescape.id, description: "in progress")
  Game.create(name:"Entretien avec Gustave Eiffel", company_id: gamescape.id, description: "in progress")
  Game.create(name:"Gentleman Cambrioleur", company_id: gamescape.id, description: "in progress")

  Game.create(name:"Cannibal Island", company_id: quest_factory.id, description: "in progress")
  Game.create(name:"Opération Balkans", company_id: quest_factory.id, description: "in progress")
  Game.create(name:"Top Secret Projet Δ", company_id: quest_factory.id, description: "in progress")

  Game.create(name:"Un Crime Presque Parfait", company_id: lock_academy.id, description: "in progress")
  Game.create(name:"Très Cher Lock", company_id: lock_academy.id, description: "in progress")
  Game.create(name:"Le Casse du Siècle", company_id: lock_academy.id, description: "in progress")

  Game.create(name:"Le Cabaret des Deux Mondes", company_id: prizoners.id, description: "in progress")
  Game.create(name:"Carbon Copy", company_id: prizoners.id, description: "in progress")
  Game.create(name:"Protocole Hawaï", company_id: prizoners.id, description: "in progress")
  Game.create(name:"Rock'Escape Upside Down", company_id: prizoners.id, description: "in progress")

  Game.create(name:"Alice", company_id: phobia.id, description: "in progress")
  Game.create(name:"Da Vinci Code", company_id: phobia.id, description: "in progress")
  Game.create(name:"Harry Houdini", company_id: phobia.id, description: "in progress")
  Game.create(name:"Les Disparus", company_id: phobia.id, description: "in progress")
  Game.create(name:"Loft 13", company_id: phobia.id, description: "in progress")


  Game.create(name:"Le Bureau de James Murdock", company_id: hinthunt.id, description: "in progress")
  Game.create(name:"Dracula", company_id: hinthunt.id, description: "in progress")
  Game.create(name:"La Zen Room", company_id: hinthunt.id, description: "in progress")
  Game.create(name:"Le Secret du Pirate", company_id: hinthunt.id, description: "in progress")
  Game.create(name:"L'Expérience Interdite", company_id: hinthunt.id, description: "in progress")

  Game.create(name:"Poursuite dans le Métropolitain", company_id: hunt_paris.id, description: "in progress")
  Game.create(name:"The Greenhouse", company_id: hunt_paris.id, description: "in progress")

  Game.create(name:"Le Diamant de la Joconde", company_id: victoryIII.id, description: "in progress")
  Game.create(name:"Game of Stones", company_id: victoryIII.id, description: "in progress")
  Game.create(name:"Les Cobayes de Shutter Island", company_id: victoryIII.id, description: "in progress")
  Game.create(name:"La Matrice", company_id: victoryIII.id, description: "in progress")

  Game.create(name:"Le Tombeau de l'Empereur Qin", company_id: x_dimension.id, description: "in progress")
  Game.create(name:"Le Secret de la Perle Noire", company_id: x_dimension.id, description: "in progress")
  Game.create(name:"Le Manoir aux Secrets", company_id: x_dimension.id, description: "in progress")
  Game.create(name:"La Grande Evasion", company_id: x_dimension.id, description: "in progress")
  Game.create(name:"X-Dimension", company_id: x_dimension.id, description: "in progress")


  Game.create(name:"Instinct de Survie", company_id: leavinroom.id, description: "in progress")
  Game.create(name:"Game Over", company_id: leavinroom.id, description: "in progress")
  Game.create(name:"Motel", company_id: leavinroom.id, description: "in progress")
  Game.create(name:"Le Pays des Merveilles", company_id: leavinroom.id, description: "in progress")

  Game.create(name:"Atlantide", company_id: majestic.id, description: "in progress")
  Game.create(name:"Titanic", company_id: majestic.id, description: "in progress")
  Game.create(name:"Oggy Prisonnier du Temps", company_id: majestic.id, description: "in progress")

  Game.create(name:"Le Motel Hante", company_id: victoryIX.id, description: "in progress")
  Game.create(name:"L'Arche Perdue", company_id: victoryIX.id, description: "in progress")
  Game.create(name:"Interstellaire", company_id: victoryIX.id, description: "in progress")
  Game.create(name:"Le Secret des Whitechapel", company_id: victoryIX.id, description: "in progress")

  Game.create(name:"La Boite: dans le noir", company_id: boite.id, description: "in progress")

  Game.create(name:"Le Virus du Professeur Zoltan", company_id: happy_hour.id, description: "in progress")
  Game.create(name:"Police Academy de Palamento City", company_id: happy_hour.id, description: "in progress")
  Game.create(name:"Les Cachots du Chevalier Noir", company_id: happy_hour.id, description: "in progress")

  Game.create(name:"Prison Break", company_id: team_break.id, description: "in progress")
  Game.create(name:"Lost", company_id: team_break.id, description: "in progress")
  Game.create(name:"Mission Infiltration", company_id: team_break.id, description: "in progress")

  Game.create(name:"Chinatown: dans les Griffes de la Triade", company_id: crack_the_egg.id, description: "in progress")
  Game.create(name:"L'Inquietant Professeur Tychsen", company_id: crack_the_egg.id, description: "in progress")
  Game.create(name:"L'Abri", company_id: crack_the_egg.id, description: "in progress")

  Game.create(name:"Les Maitres du Temps", company_id: sixtyminutes.id, description: "in progress")
  Game.create(name:"Les Infiltrés", company_id: sixtyminutes.id, description: "in progress")
  Game.create(name:"Le Cheval du Joker", company_id: sixtyminutes.id, description: "in progress")

  Game.create(name:"L'Elixir d'Octave le Vampire", company_id: tempete.id, description: "in progress")
  Game.create(name:"Les Naufrages du Liberté", company_id: tempete.id, description: "in progress")
  Game.create(name:"Enquête de Haut Vol", company_id: tempete.id, description: "in progress")

  Game.create(name:"La Supérette", company_id: roomrush.id, description: "in progress")
  Game.create(name:"La Grande Horloge", company_id: roomrush.id, description: "in progress")
  Game.create(name:"La Reine D'Angleterre", company_id: roomrush.id, description: "in progress")

  Game.create(name:"Le Patient de la Chambre 8", company_id: epsilon.id, description: "in progress")
end

puts "---------------"
puts "escape companies - start"
escape_companies
puts "escape companies - end"
puts "---------------"

puts "---------------"
puts "escape games - start"
the_game_escape_games
escape_games
puts "escape games - end"
puts "---------------"






# My Plays
# Casino
# won
# 54:21



# Braquage a la francaise
# won

# end

# others

# Pirate
# Voyage dans le temps


# Epsilon
# hopital psychiatrique
# won
# 45min

# room rush
#superette
#won
