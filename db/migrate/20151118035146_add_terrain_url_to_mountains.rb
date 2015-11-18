class AddTerrainUrlToMountains < ActiveRecord::Migration
  def change
    add_column :mountains, :terrain_url, :string, :default => "n/a"

  end
end
