class AddLiftsOpenToMountains < ActiveRecord::Migration
  def change
    add_column :mountains, :lifts_open, :string, :default => "n/a"
  end
end
