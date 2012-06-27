class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name,                   :null => false
      t.string :team,                   :null => false
      t.string :sex,                    :null => false
      t.integer :age,  :precision => 3, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end

end
