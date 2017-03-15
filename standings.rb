require 'pry'
require_relative './teams.rb'



def compare_scores()
  # file = File.open('sample-input.txt', 'r')
  # league_results = file.read.split("\n")
  results = []
  league_results.each do |t|
    Team.read_game_score(t)
  end
  Team.output_rankings
end
compare_scores
