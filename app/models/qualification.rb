class Qualification < ActiveRecord::Base
  attr_accessible :first, :second, :third, :fourth, :total, :standings

  belongs_to :player

  def summary
    player.qualification.total = player.qualification.first + player.qualification.second + player.qualification.third + player.qualification.fourth
    player.qualification.save
    return player.qualification.total
  end

  def sort_ranking
    @sort = Player.all
    ranking = 0
    @sort.each do |sort|
      if player.qualification.total <= sort.qualification.total
        ranking = ranking + 1
      end
    end
    player.qualification.standings = ranking
    player.qualification.save
    return player.qualification.standings
  end

end
