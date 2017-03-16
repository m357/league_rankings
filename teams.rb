class Team
  attr_accessor :name, :wins, :losses, :ties


  @@all_teams = []

  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
    @ties = 0
  end

  def self.all_teams
    @@all_teams
  end

  def self.create(name)
      t = Team.new(name)
      @@all_teams << t
      return t
  end

  def self.find(name)
    Team.all_teams.each do |team|
      if team.name == name
        return team
      end
    end
    return false
  end

  def self.find_or_create(name)
    team = Team.find(name) || Team.create(name)
  end

  def self.sort_all_by_score
    @@all_teams.sort { |x,y| y.total_points <=> x.total_points }
  end

  def self.output_rankings
    league = Team.sort_all_by_score
    last_num = 0
    last_index = 0
    league.each_with_index do |t, index|
      if t.total_points != last_num
        i = index +1
      else
        i = last_index
      end
      last_num = t.total_points
      last_index = i
      puts "#{i}. #{t.print_standing}"
    end

  end

  def self.read_game_score(score)
      finalscore = score.split(',')
      team1 = finalscore[0].strip
      team2 = finalscore[1].strip

      team1score = team1[/\d+/]
      team2score = team2[/\d+/]
      team1name = team1.gsub(/[0-9]/,"").strip
      team2name = team2.gsub(/[0-9]/,"").strip
      #splits line into each team and their result and finds assigns and points

      team1 = find_or_create(team1name)
      team2 = find_or_create(team2name)

      if team1score > team2score
        team1.wins += 1
        team2.losses += 1
      elsif team1score < team2score
        team2.wins += 1
        team1.losses += 1
      elsif team1score == team2score
        team1.ties += 1
        team2.ties += 1
      end
  end


  def total_points
    (self.wins * 3) + (self.ties * 1)
  end

  def print_standing
    return "#{self.name}, #{self.total_points}"
  end
end
