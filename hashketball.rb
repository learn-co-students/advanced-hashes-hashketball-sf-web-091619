require 'pry'

def game_hash
  the_game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        { "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }},
        { "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }},
        { "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }},
        { "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }},
        { "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }}
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        { "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }},
        { "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        }},
        { "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }},
        { "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }},
        { "Kemba Walker" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }}
      ]
    }
  }
end

def num_points_scored(player)
  game_hash.each { |location, stats|
    stats[:players].each { |name|
      return name[player][:points] if name.has_key?(player)
    }
  }
end

def shoe_size(player)
  game_hash.each { |location, stats|
    stats[:players].each { |name|
      return name[player][:shoe] if name.has_key?(player)
    }
  }
end

def team_colors(team)
  game_hash.each { |location, stats| 
    return stats[:colors] if stats[:team_name] == team
  }
end

def team_names
  names = []
  game_hash.each { |location, stats|
    names.push(stats[:team_name]) 
  }
  return names
end

def player_numbers(team)
  numbers = []
  game_hash.each { |location, stats|
    if team == stats[:team_name]
      stats[:players].each { |player|
        player.each { |name, info| numbers.push(info[:number]) }
      }
    end
  }
  numbers
end

def player_stats(player)
  game_hash.each { |location, stats|
    stats[:players].each { |name|
      return name[player] if name.has_key?(player)
    }
  }
end

def big_shoe_rebounds
  shoe = 0
  rebound = 0
  game_hash.each { |location, stats|
    stats[:players].each { |player|
      player.each { |name, info|
        if shoe < info[:shoe]
          shoe = info[:shoe]
          rebound = info[:rebounds]
        end
      }
    }
  }
  return rebound
end

def most_points_scored
  points = 0
  winner = nil
  game_hash.each { |location, stats|
    stats[:players].each { |player|
      player.each { |name, info|
        if points < info[:points]
          winner = name
          points = info[:points]
        end
      }
    }
  }
  return winner
end

def winning_team
  nets_score = 0
  hornets_score = 0
  game_hash.each { |location, stats|
    if stats[:team_name] == "Brooklyn Nets"
      stats[:players].each { |player|
        player.each { |name, info|
          nets_score += info[:points]
        }
      }
    end
  }
  game_hash.each { |location, stats|
    if stats[:team_name] == "Charlotte Hornets"
      stats[:players].each { |player|
        player.each { |name, info|
          hornets_score += info[:points]
        }
      }
    end
  }
  if nets_score > hornets_score
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end

def player_with_longest_name
  thename = nil
  size = 0
  game_hash.each { |location, stats|
    stats[:players].each { |player|
      player.each { |name, info|
        if name.length > size
          size = name.length
          thename = name
        end
      }
    }
  }
  return thename
end

def long_name_steals_a_ton?
  thief = nil
  steals = 0
  
  thename = nil
  size = 0
  game_hash.each { |location, stats|
    stats[:players].each { |player|
      player.each { |name, info|
        if name.length > size
          size = name.length
          thename = name
        end
      }
    }
  }
  
  game_hash.each { |location, stats|
    stats[:players].each { |player|
      player.each { |name, info|
        if steals < info[:steals]
          steals = info[:steals]
          thief = name
        end
      }
    }
  }
  if thename == thief
    return true
  else
    return false
  end
end