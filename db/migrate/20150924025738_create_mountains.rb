class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.string :zip_code
      t.string :opening_date
      t.string :video_url

      t.timestamps
    end
  end
end
