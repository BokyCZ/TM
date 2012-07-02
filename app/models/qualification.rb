class Qualification < ActiveRecord::Base
  attr_accessible :first, :second, :third, :fourth, :total, :standings

  belongs_to :player

  def summary
    player.qualification.total = player.qualification.first + player.qualification.second + player.qualification.third + player.qualification.fourth
    player.qualification.save
  end

  def sort_ranking
    @sort = Player.all
    ranking = 0
    n = 0
    @sort.each do |sort|
      if player.qualification.total <= sort.qualification.total
        ranking = ranking + 1
      end
      if player.qualification.total == sort.qualification.total
        n = n + 1
      end
    end
    if n == 0
      player.qualification.standings = ranking
    else
      player.qualification.standings = ranking - (n - 1)
    end
    player.qualification.save
  end

end
