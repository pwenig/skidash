class TravelAlert

  require 'httparty'

attr_accessor :road_alerts

  def initialize
    road_alert_hash = fetch_road_alerts
    assign_values(road_alert_hash)
  end

  def fetch_road_alerts
    auth = {:username => "#{ENV['CDOT_USERNAME']}", :password => "#{ENV['CDOT_PASSWORD']}"}
    HTTParty.get(" https://data.cotrip.org/xml/alerts.xml",
                 :basic_auth => auth)
  end

  def assign_values(alert_hash)
    restrictions = []
    no_alerts = {}
    alert_hash["Alerts"]["Alert"].each do |response|

      if response["Type"] == "Restriction" && response["Impact"]== "Severe" && response["RoadName"] == "I-70"

        restrictions << response
      end
    end

    if restrictions.count == 0
      no_alerts["Title"] = "NONE"
      no_alerts["Headline"] = ''
      no_alerts["Description"] = ''

      restrictions << no_alerts
    end

    self.road_alerts = restrictions

  end
end