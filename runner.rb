require_relative './standings.rb'

def run_all()
  puts "League standings calculator"
  puts "Please enter your league's results:"
  input = gets.chomp
  file = File.open(input, 'r').read.split("\n")
  compare_scores(file)
end
run_all
