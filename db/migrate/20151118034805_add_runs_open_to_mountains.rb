class AddRunsOpenToMountains < ActiveRecord::Migration
  def change
    add_column :mountains, :runs_open, :string, :default => "n/a"

  end
end
