require 'spec_helper'

describe Team do
  before do
    @team = Team.create("Falcons")
    @team.wins = 3
    @team.losses = 1
    @team.ties = 2

    @team2 = Team.create("Tigers")
    @team2.wins = 2
    @team2.losses = 1
    @team2.ties = 0
  end

  it "has a name" do
    expect(@team.name).to eq("Falcons")
  end

  it "has wins" do
    expect(@team.wins).to eq(3)
  end
  it "has losses" do
    expect(@team.losses).to eq(1)
  end
  it "has ties" do
    expect(@team.ties).to eq(2)
  end

  it "saves teams" do
    expect(Team.all_teams).to include(@team)
  end

  it "has total points" do
    expect(@team.total_points).to eq(11)
  end

  it "can read the game score" do
   score = "Falcons 5, Tigers 2"
   Team.read_game_score(score)
   expect(Team.find("Falcons").wins).to eq(4)
   expect(Team.find("Tigers").losses).to eq(2)
  end

  it "can print the team's current standing" do
    expect(@team.print_standing).to match("Falcons, 11")
  end


end
