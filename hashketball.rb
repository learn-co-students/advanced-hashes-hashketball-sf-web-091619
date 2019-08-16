require "pry"

def game_hash

  {:home => {
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
        :slam_dunks => 1}}, 
      {"Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7}}, 
      {"Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15}},
      {"Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5}},
      {"Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}}
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
        :slam_dunks => 2}},
      {"Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10}},
      {"DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5}},
      {"Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0}},
      {"Kemba Walker" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12}}
      ]
    }
  }
end

def num_points_scored(player_name)
  combined_players = game_hash[:home][:players] + game_hash[:away][:players]
  player = combined_players.select { |x| x[player_name] }
  player[0][player_name][:points]
end

def shoe_size(player_name)
  combined_players = game_hash[:home][:players] + game_hash[:away][:players]
  player = combined_players.select { |x| x[player_name] }
  player[0][player_name][:shoe]
end

def team_colors(team_name)
  
  game_hash.each do |location, team_data|
    return team_data[:colors] if team_data[:team_name] == team_name
  end
end

def team_names
  game_hash.reduce([]) do |memo, (location, team_data)|
    memo.push(team_data[:team_name])
    memo
  end
end

def player_numbers(team_name)
  players_array = []
  
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_items|
            data_items.each do |key, value|
              players_array.push(value[:number])
            end
          end
        end
      end
    end
  end
  players_array
end

def player_stats(player_name)
  player_list = game_hash[:home][:players] + game_hash[:away][:players]
  
  player_list.each do |player_h| 
    player_h.each do |key, value|
      return value if key == player_name
    end
  end
end

def big_shoe_rebounds
  player_list = game_hash[:home][:players] + game_hash[:away][:players]
  
  biggest_shoe = 0
  the_player = nil
  rebounds = 0
  
  player_list.each do |player|
    player.each do |key, value|
      if value[:shoe] > biggest_shoe
        biggest_shoe = value[:shoe]
        the_player = key
        rebounds = value[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  player_list = game_hash[:home][:players] + game_hash[:away][:players]
  the_player = nil
  points = 0
  
  player_list.each do |player|
    player.each do |key, value|
      if value[:points] > points
        points = value[:points]
        the_player = key
      end
    end
  end
  the_player
end

def winning_team
  home_team = game_hash[:home][:players]
  away_team = game_hash[:away][:players]
  home_points = 0
  away_points = 0
  
  home_team.each do |player|
    player.each do |key, value|
      home_points += value[:points]
    end
  end
  
  away_team.each do |player|
    player.each do |key, value|
      away_points += value[:points]
    end
  end
  
  if home_points > away_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
  
end

def player_with_longest_name
  player_list = game_hash[:home][:players] + game_hash[:away][:players]
  length_of_name = 0
  the_player = nil
  
  player_list.each do |player|
    player.each do |key, value|
      if key.length > length_of_name
        length_of_name = key.length
        the_player = key
      end
    end
  end
  the_player
end

def long_name_steals_a_ton? 
  player_list = game_hash[:home][:players] + game_hash[:away][:players]
  longest_name = player_with_longest_name
  steal_count = 0
  the_player = nil
  
  player_list.each do |player|
    player.each do |key, value|
      if value[:steals] > steal_count
        steal_count = value[:steals]
        the_player = key
      end
    end
  end
  longest_name == the_player
end

