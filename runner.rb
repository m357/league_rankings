require_relative './standings.rb'

def run_all()
  puts "Welcome to the league standings calculator!"
  puts "Please enter the filepath where your league's results live:"
  input = gets.chomp
  file = File.open(input, 'r').read.split("\n")
  compare_scores(file)
end
run_all
