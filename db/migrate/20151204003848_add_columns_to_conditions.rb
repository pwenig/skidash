class AddColumnsToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :condition, :text
    add_column :conditions, :wind, :text
    add_column :conditions, :forecast_today, :text
    add_column :conditions, :high_temp, :integer
    add_column :conditions, :low_temp, :integer
    add_column :conditions, :snow_today, :integer
    add_column :conditions, :forecast_title_day2, :string
    add_column :conditions, :forecast_day2, :text
    add_column :conditions, :forecast_title_day3, :string
    add_column :conditions, :forecast_day3, :text
  end
end
