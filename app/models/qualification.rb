class Qualification < ActiveRecord::Base
  attr_accessible :first, :second, :third, :fourth, :total, :standings

  belongs_to :player
end
