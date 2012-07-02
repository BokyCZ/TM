class CreateCompetitions < ActiveRecord::Migration
  def self.up
    create_table :competitions do |t|
      t.integer     :first_round,         :precision => 3, :null => false, :default => 0
      t.integer     :second_round,        :precision => 3, :null => false, :default => 0
      t.integer     :third_round,         :precision => 3, :null => false, :default => 0
      t.integer     :quarterfinal_round,  :precision => 3, :null => false, :default => 0
      t.integer     :semifinal_round,     :precision => 3, :null => false, :default => 0
      t.integer     :final_round,         :precision => 3, :null => false, :default => 0
      t.integer     :draw,                :precision => 2, :null => false, :default => 0
      t.references  :player,                               :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :competitions
  end

end
