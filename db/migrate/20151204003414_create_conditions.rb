class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.belongs_to :mountain
      t.integer :temperature
      t.timestamps

    end
  end

  def self.down
    drop_table :conditions
  end

end
