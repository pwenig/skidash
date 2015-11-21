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
    travel_time
  end


  def weather_condition_lookup(mountain_ids)
    mountain_info = {}
    @mountain_conditions = []
    mountain_ids.each do |id|
      mountain = Mountain.find(id)
      mountain_info[:name] = mountain[:name]
      mountain_info[:video_url] = mountain[:video_url]
      mountain_info[:terrain_url] = mountain[:terrain_url]
      mountain_info[:runs_open] = mountain[:runs_open]
      mountain_info[:lifts_open] = mountain[:lifts_open]
      weather_condition = WeatherCondition.new(mountain[:zip_code])
     @mountain_conditions << [mountain_info, weather_condition.condition_hash, weather_condition.forecast_hash].inject(:merge)
    end


  end

  def travel_time
    @travel_time_breck = TravelTime.new('Breckenridge', 'CO')
    @travel_time_vail = TravelTime.new('Vail', 'CO')
  end



end