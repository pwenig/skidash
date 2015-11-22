class RemoveImagesFromMountains < ActiveRecord::Migration
  def change
    remove_column :mountains, :images
  end
end
