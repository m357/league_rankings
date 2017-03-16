require 'pry'
require_relative './teams.rb'

def compare_scores(file)
  results = []
  file.each do |score|
    Team.read_game_score(score)
  end
  Team.output_rankings
end
