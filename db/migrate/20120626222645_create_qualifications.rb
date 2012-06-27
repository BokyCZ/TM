class CreateQualifications < ActiveRecord::Migration
  def self.up
    create_table :qualifications  do |t|
      t.integer    :first,      :precision => 3, :null => false, :default => 0
      t.integer    :second,     :precision => 3, :null => false, :default => 0
      t.integer    :third,      :precision => 3, :null => false, :default => 0
      t.integer    :fourth,     :precision => 3, :null => false, :default => 0
      t.integer    :total,      :precision => 4, :null => false, :default => 1
      t.integer    :standings,  :precision => 3, :null => false, :default => 1
      t.references :player,                      :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :qualifications
  end

end
