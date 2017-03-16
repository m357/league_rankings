require 'spec_helper'
require 'pry'

describe "CLI Runner" do
    sample_input =["Lions 3, Snakes 3
    Tarantulas 1, FC Awesome 0
    Lions 1, FC Awesome 1
    Tarantulas 3, Snakes 1
    Lions 4, Grouches 0"]

    expected_output = ["1. Tarantulas, 6 pts
    2. Lions, 5 pts
    3. FC Awesome, 1 pt
    3. Snakes, 1 pt
    5. Grouches, 0 pts"]

    it "calculates the league rankings" do
      compare_scores(sample_input)
    end
end
