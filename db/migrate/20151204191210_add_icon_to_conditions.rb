class AddIconToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :icon, :string
  end
end
