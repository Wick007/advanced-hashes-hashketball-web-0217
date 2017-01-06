require 'pry'

def game_hash
         {:home => {
           :team_name => "Brooklyn Nets",
           :colors => ["Black","White"],
           :players => {"Alan Anderson" => {
                                      :number => 0,
                                      :shoe => 16,
                                      :points => 22,
                                      :rebounds => 12,
                                      :assists => 12,
                                      :steals => 3,
                                      :blocks => 1,
                                      :slam_dunks => 1
                                      },
                       "Reggie Evans" => {
                                      number: 30,
                                      shoe: 14,
                                      points: 12,
                                      rebounds: 12,
                                      assists: 12,
                                      steals: 12,
                                      blocks: 12,
                                      slam_dunks: 7},
                    "Brook Lopez" => {
                                      number: 11,
                                      shoe: 17,
                                      points: 17,
                                      rebounds: 19,
                                      assists: 10,
                                      steals: 3,
                                      blocks: 1,
                                      slam_dunks: 15},
                    "Mason Plumlee" => {
                                      number: 1,
                                      shoe: 19,
                                      points: 26,
                                      rebounds: 12,
                                      assists: 6,
                                      steals: 3,
                                      blocks: 8,
                                      slam_dunks: 5},
                    "Jason Terry" => {
                                      number: 31,
                                      shoe: 15,
                                      points: 19,
                                      rebounds: 2,
                                      assists: 2,
                                      steals: 4,
                                      blocks: 11,
                                      slam_dunks: 1},
                                    }},
           :away => {
             :team_name => "Charlotte Hornets",
             :colors => ["Turquoise", "Purple"],
             :players => {"Jeff Adrien" => {
                                    number: 4,
                                    shoe: 18,
                                    points: 10,
                                    rebounds: 1,
                                    assists: 1,
                                    steals: 2,
                                    blocks: 7,
                                    slam_dunks: 2},
                          "Bismak Biyombo" => {
                                    number: 0,
                                    shoe: 16,
                                    points: 12,
                                    rebounds: 4,
                                    assists: 7,
                                    steals: 7,
                                    blocks: 15,
                                    slam_dunks: 10},
                          "DeSagna Diop" => {
                                    number: 2,
                                    shoe: 14,
                                    points: 24,
                                    rebounds: 12,
                                    assists: 12,
                                    steals: 4,
                                    blocks: 5,
                                    slam_dunks: 5},
                          "Ben Gordon" => {
                                    number: 8,
                                    shoe: 15,
                                    points: 33,
                                    rebounds: 3,
                                    assists: 2,
                                    steals: 1,
                                    blocks: 1,
                                    slam_dunks: 0},
                          "Brendan Haywood" => {
                                    number: 33,
                                    shoe: 15,
                                    points: 6,
                                    rebounds: 12,
                                    assists: 12,
                                    steals: 22,
                                    blocks: 5,
                                    slam_dunks: 12},
                             },
                          },
                      }
end


def num_points_scored(player_name)
  if player_name == "Alan Anderson" || player_name == "Reggie Evans" || player_name == "Brook Lopez" || player_name == "Mason Plumlee" || player_name == "Jason Terry"
    return game_hash[:home][:players][player_name][:points]
  elsif player_name == "Jeff Adrien" || player_name == "Bismak Biyombo" || player_name == "DeSagna Diop" || player_name == "Ben Gordon" || player_name == "Brendan Haywood"
    return game_hash[:away][:players][player_name][:points]
  end
end

def shoe_size(player_name)
  if player_name == "Alan Anderson" || player_name == "Reggie Evans" || player_name == "Brook Lopez" || player_name == "Mason Plumlee" || player_name == "Jason Terry"
    return game_hash[:home][:players][player_name][:shoe]
  elsif player_name == "Jeff Adrien" || player_name == "Bismak Biyombo" || player_name == "DeSagna Diop" || player_name == "Ben Gordon" || player_name == "Brendan Haywood"
    return game_hash[:away][:players][player_name][:shoe]
  end
end

def team_colors(team_name)
  if team_name == "Brooklyn Nets"
    return game_hash[:home][:colors]
  elsif team_name == "Charlotte Hornets"
    return game_hash[:away][:colors]
  end
end

def team_names
  teams_array = []
  game_hash.each do |k, v|
    v.each do |attribute, data|
      if attribute == :team_name
        teams_array << data
      end
    end
  end
  return teams_array
end

def player_numbers(team_name)
  num_array = []
  if team_name == game_hash[:home][:team_name]
    game_hash[:home][:players].each do |name, stats|
      stats.each do |cat, v|
        if cat == :number
          num_array << v
        end
      end
    end
    return num_array
  elsif team_name == game_hash[:away][:team_name]
    game_hash[:away][:players].each do |name, stats|
      stats.each do |cat, v|
        if cat == :number
          num_array << v
        end
      end
    end
    return num_array
  end
end

def player_stats(player_name)
  stats_hash = {}
  if game_hash[:home][:players].has_key?(player_name)
    return game_hash[:home][:players][player_name]
  elsif game_hash[:away][:players].has_key?(player_name)
    return game_hash[:away][:players][player_name]
  else
    return "no go"
  end
end

def big_shoe_rebounds
  shoe_array = []
  shoe_array2 = []
  game_hash[:home][:players].each do |player, stats|
    stats.each do |stat, v|
      if stat == :shoe
        shoe_array << v
      end
    end
  end
  home_biggest = shoe_array.max
  game_hash[:away][:players].each do |player, stats|
    stats.each do |stat, v|
      if stat == :shoe
        shoe_array2 << v
      end
    end
  end
  away_biggest = shoe_array2.max
  if away_biggest > home_biggest
    game_hash[:away][:players].each do |player, stats|
      stats.each do |stat, v|
        if stat == :shoe && v == away_biggest
          return game_hash[:home][:players][player][:rebounds]
        end
      end
    end
  elsif home_biggest > away_biggest
    game_hash[:home][:players].each do |player, stats|
      stats.each do |stat, v|
        if stat == :shoe && v == home_biggest
          return game_hash[:home][:players][player][:rebounds]
        end
      end
    end
  end
end

=begin
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end
good_practices
=end
