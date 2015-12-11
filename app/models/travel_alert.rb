class TravelAlert

  require 'Httparty'

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
    alerts = []

    alert_hash["Alerts"]["Alert"].each do |response|
      if response["Type"] == "Restriction" && response["RoadName"] == "I-70"
        restrictions << response
      end
    end
    restrictions.each do |restriction|
      alerts << restriction["Title"] << restriction["Headline"] << restriction["Description"]
    end
    self.road_alerts = alerts.join(',').gsub(/,/,". ").gsub('<b>','').gsub('</b>','')
  end

end