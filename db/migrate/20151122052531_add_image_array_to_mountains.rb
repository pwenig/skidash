class AddImageArrayToMountains < ActiveRecord::Migration
  def change

    add_column :mountains, :images, :string, default: []
  end
end
