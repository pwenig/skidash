class AddMtnImageToMountains < ActiveRecord::Migration
  def change
    add_column :mountains, :mtn_image1, :string
    add_column :mountains, :mtn_image2, :string
    add_column :mountains, :mtn_image3, :string

  end
end
