require 'pry'
require_relative './teams.rb'


def compare_scores
  # file = File.open('sample-input.txt', 'r')
  puts "League standings calculator"
  puts "Please enter your league's results:"
  input = gets.chomp
  # league_results = file.read.split("\n")
  file = File.open(input, 'r').read.split("\n")
  results = []
  file.each do |t|
    Team.read_game_score(t)
  end
  Team.output_rankings
end
compare_scores
