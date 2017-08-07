
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
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
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        },
      },
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        },
      },
    },
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, l_data|
    l_data.each do |attribute, a_data|
      if attribute == :players
        a_data.each do |player, stats|
          if player == player_name
            return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, l_data|
    l_data.each do |attribute, a_data|
      if attribute == :players
        a_data.each do |player, stats|
          if player == player_name
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, l_data|
    l_data.each do |attribute, a_data|
      if a_data == team_name
        #attribute = :team_name a_data = "Brooklyn Nets"
        return l_data[:colors]
      end
    end
  end
end

def team_names
  teams_array = []

  game_hash.each do |location, l_data|
    l_data.each do |attribute, a_data|
      if attribute == :team_name
        teams_array << a_data
      end
    end
  end
  teams_array
end

def player_numbers(team)
  jersey_array = []

  game_hash.each do |location, l_data|
    l_data.each do |attribute, a_data|
      if attribute == :team_name
        if team == l_data[:team_name]
          l_data[:players].each do |name, p_data|
            jersey_array << p_data[:number]
          end
        end
      end
    end
  end
  jersey_array
end

def player_stats(player_name)
  game_hash.each do |location, l_data|
    l_data.each do |attribute, a_data|
      if attribute == :players
        a_data.each do |player, stats|
          if player == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds#(game_hash)???
  player_shoe_array = []

  game_hash.each do |location, l_data|
    l_data.each do |attribute, a_data|
      if attribute == :players
        a_data.each do |player, stats|
          empty_array = Array.new(3)
          empty_array[0] = player
          empty_array[1] = stats[:shoe]
          empty_array[2] = stats[:rebounds]
          player_shoe_array << empty_array
        end
      end
    end
  end
  player_shoe_array.sort_by! { |a| a[1] }
  player_shoe_array[0][2]
end
