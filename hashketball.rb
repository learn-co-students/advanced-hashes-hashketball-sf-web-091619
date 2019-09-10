require "pry"


# Write your code here!
def game_hash
  my_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {"Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }}, 
        {"Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }}, 
        {"Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }}, 
        {"Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }}, 
        {"Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }}
      ]
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {"Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }}, 
        {"Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        }}, 
        {"DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }}, 
        {"Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }}, 
        {"Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }}
      ]
    }
  }
  my_hash
end


# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#     team_data.each do |attribute, data|
#       #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#       binding.pry
 
#       #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
#       data.each do |data_item|
#           binding.pry
#       end
#     end
#   end
# end

# good_practices

def num_points_scored(name)
  game_hash.each do |key, values|
    game_hash[key][:players].each do |element|
      element.each do |names, info|
        if names == name
          return info[:points]
        end
      end
    end
  end
  "Player not found"
end



num_points_scored("Jeff Adrien")

def shoe_size(name)
  game_hash.each do |key, values|
    game_hash[key][:players].each do |element|
      element.each do |names, info|
        if names == name
          return info[:shoe]
        end
      end
    end
  end
  "Player not found"
end


def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    return game_hash[:away][:colors]
  else
    return "Team not found"
  end
end

def team_names
  teams = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
  teams
end

def player_numbers(team)
  jerseys = []
   game_hash.each do |key, values|
    if game_hash[key][:team_name] == team 
      game_hash[key][:players].each do |element|
        element.each do |names, info|
          jerseys << info[:number]
        end
      end
    end
   end
jerseys
end

def player_stats(name)
  game_hash.each do |key, values|
    game_hash[key][:players].each do |element|
      element.each do |names, info|
        if names == name
          return info
        end
      end
    end
  end
  "Player not found"
end
  

def big_shoe_rebounds
  biggest = 0
  most_rebounds = 0
  game_hash.each do |key, values|
      game_hash[key][:players].each do |element|
        element.each do |names, info|
          if info[:shoe] > biggest
            biggest = info[:shoe]
            most_rebounds = info[:rebounds]
          end
        end
      end
  end
  most_rebounds
end

def most_points_scored
  most = 0
  player = ""
  game_hash.each do |key, values|
      game_hash[key][:players].each do |element|
        element.each do |names, info|
          if info[:points] > most
            most = info[:points]
            player = names
          end
        end
      end
  end
  player
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |element|
    element.each do |names, info|
        home_points += info[:points]
    end
  end
  game_hash[:away][:players].each do |element|
    element.each do |names, info|
        away_points += info[:points]
    end
  end
  if home_points > away_points
    return game_hash[:home][:team_name]
  elsif away_points > home_points
    return game_hash[:away][:team_name]
  else
    return "Tie Game"
  end
end


def player_with_longest_name
  longest = 0
  long_player = ""
  game_hash.each do |key, values|
      game_hash[key][:players].each do |element|
        element.each do |names, info|
          if names.length > longest
            longest = names.length
            long_player = names
          end
        end
      end
  end
  long_player
end


def long_name_steals_a_ton?
  longest = 0
  long_player = ""
  most = 0
  player = ""
  game_hash.each do |key, values|
      game_hash[key][:players].each do |element|
        element.each do |names, info|
          if names.length > longest
            longest = names.length
            long_player = names
          end
           if info[:steals] > most
            most = info[:steals]
            player = names
           end
        end
      end
  end
  # most = 0
  # player = ""
  # game_hash.each do |key, values|
  #     game_hash[key][:players].each do |element|
  #       element.each do |names, info|
  #         if info[:steals] > most
  #           most = info[:steals]
  #           player = names
  #         end
  #       end
  #     end
  # end
  
  return long_player == player
end
  