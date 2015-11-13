class MountainsController < ApplicationController

  def new
    @mountain = Mountain.new
  end


  def index
    mountains_zip_codes = []

    if params[:mountain1][:id].present?
      mountain1 = Mountain.find(params[:mountain1][:id])
      mountain1_zip = mountain1[:zip_code]
      mountains_zip_codes << mountain1_zip
    else
    end

    if params[:mountain2][:id].present?
        mountain2 = Mountain.find(params[:mountain2][:id])
        mountain2_zip = mountain2[:zip_code]
        mountains_zip_codes << mountain2_zip
    else
    end

    if params[:mountain3][:id].present?
      mountain3 = Mountain.find(params[:mountain3][:id])
      mountain3_zip = mountain3[:zip_code]
      mountains_zip_codes << mountain3_zip
    else
    end

    if params[:mountain4][:id].present?
      mountain4 = Mountain.find(params[:mountain4][:id])
      mountain4_zip = mountain4[:zip_code]
      mountains_zip_codes << mountain4_zip
    else
    end

    weather_condition_lookup(mountains_zip_codes)
    travel_time
  end


  def weather_condition_lookup(mountains_zip_codes)
    mountain_info = {}
    @mountain_conditions = []
    mountains_zip_codes.each do |zip|
      mountain = Mountain.find_by_zip_code(zip)
      mountain_info[:name] = mountain[:name]
      mountain_info[:video_url] = mountain[:video_url]
      weather_condition = WeatherCondition.new(zip)
     @mountain_conditions << [mountain_info, weather_condition.condition_hash, weather_condition.forecast_hash].inject(:merge)
    end


  end

  def travel_time
    @travel_time_breck = TravelTime.new('Breckenridge', 'CO')
    @travel_time_vail = TravelTime.new('Vail', 'CO')
  end



end