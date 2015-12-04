class MountainsController < ApplicationController

  def new
    @mountain = Mountain.new
  end


  def index
    mountain_ids = []
    new_params = {}
    new_params[:mountains] = params[:mountain1], params[:mountain2], params[:mountain3], params[:mountain4]
    new_params[:mountains].each do |mountain|
      if mountain[:id].present?
        mountain_ids << mountain[:id]
      end
    end
    mountain_ids

    weather_condition_lookup(mountain_ids)
  end


  def weather_condition_lookup(mountain_ids)
    mountain_info = {}
    condition_info = {}
    @mountain_conditions = []
    mountain_ids.each do |id|
      mountain = Mountain.find(id)
      mountain_info[:name] = mountain[:name]
      mountain_info[:mtn_image1] = mountain[:mtn_image1]
      mountain_info[:mtn_image2] = mountain[:mtn_image2]
      mountain_info[:mtn_image3] = mountain[:mtn_image3]
      mountain_info[:terrain_url] = mountain[:terrain_url]
      mountain_info[:runs_open] = mountain[:runs_open]
      mountain_info[:lifts_open] = mountain[:lifts_open]
      mountain_info[:base] = mountain[:base]

      condition = Condition.where(:mountain_id => id).last
      condition_info[:temperature] = condition[:temperature]
      condition_info[:condition] = condition[:condition]
      condition_info[:icon] = condition[:icon]
      condition_info[:wind] = condition[:wind]
      condition_info[:forecast_today] = condition[:forecast_today]
      condition_info[:high_temp] = condition[:high_temp]
      condition_info[:low_temp] = condition[:low_temp]
      condition_info[:snow_today] = condition[:snow_today]
      condition_info[:forecast_title_day2] = condition[:forecast_title_day2]
      condition_info[:forecast_day2] = condition[:forecast_day2]
      condition_info[:forecast_title_day3] = condition[:forecast_title_day3]
      condition_info[:forecast_day3] = condition[:forecast_day3]
      condition_info[:updated_at] = updated_time(condition[:updated_at])
     @mountain_conditions << [mountain_info, condition_info].inject(:merge)
    end

  end

  def updated_time(time)
    mountain_time = time.in_time_zone("Mountain Time (US & Canada)")
    mountain_time.strftime("%A %I:%M %P")
  end

end



