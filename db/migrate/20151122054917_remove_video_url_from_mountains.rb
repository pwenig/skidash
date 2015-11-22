class RemoveVideoUrlFromMountains < ActiveRecord::Migration
  def change
  remove_column :mountains, :video_url
  end
end
