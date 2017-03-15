require 'pry'
require_relative './teams.rb'

def compare_scores(file)
  results = []
  file.each do |t|
    Team.read_game_score(t)
  end
  Team.output_rankings
end
