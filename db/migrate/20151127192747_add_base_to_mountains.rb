class AddBaseToMountains < ActiveRecord::Migration
  def change
    add_column :mountains, :base, :string

  end
end
