require 'pry'

def game_hash 
  {
  :home => { :team_name => "Brooklyn Nets",
             :colors => ["Black","White"],
             :players => [{
                :player_name => "Alan Anderson",
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1
             },{
                :player_name => "Reggie Evans",
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7
             },{
                :player_name => "Brook Lopez",
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15
             },{
                :player_name => "Mason Plumlee",
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 11,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5
             },{
                :player_name => "Jason Terry",
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1
             }
            ]
          }, 
  :away => { :team_name => "Charlotte Hornets",
             :colors => ["Turquoise","Purple"],
                :players => [{
                :player_name => "Jeff Adrien",
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2
             },{
                :player_name => "Bismack Biyombo",
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 22,
                :blocks => 15,
                :slam_dunks => 10
             },{
                :player_name => "DeSagna Diop",
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5
             },{
                :player_name => "Ben Gordon",
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0
             },{
                :player_name => "Kemba Walker",
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 7,
                :blocks => 5,
                :slam_dunks => 12
      }
    ]
  }
 }
end

def num_points_scored(player_name)
  game_hash.each do |side, team|
    team.each do |key, value|
      if key == :players
        value.each do |player|
          if player[:player_name] == player_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |side, team|
    team.each do |key, value|
      if key == :players
        value.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |side, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end


def team_names
  required_array = []
  game_hash.each do |side, team|
    required_array.push(team[:team_name])
  end
  required_array
end

def player_numbers(team_name)
array = []
game_hash.each do |side, team_NAME|
  if team_NAME[:team_name] == team_name
    allPlayers = team_NAME[:players]
    allPlayers.each do |playerKey, playerValue|
      array.push(playerKey[:number])
      end
    end
  end
array
end

def player_stats(players_name)
solution = Hash.new
game_hash.each do |side, info|
info.each do |key, value|
if key == :players
value.each do |key_1|
if key_1[:player_name] == players_name
solution = key_1.delete_if do |key_1, value_1|
  key_1 == :player_name
            end
          end
        end
      end
    end
  end
solution
end


def big_shoe_rebounds
  max = 0 
  rebound = 0
  game_hash.each do |side, team|
    team[:players].each do |key|
      shoe_size = key[:shoe]
      if shoe_size > max
        max = key[:shoe]
      rebound = key[:rebounds]
      # binding.pry
      end   
    end
  end
  rebound
end












