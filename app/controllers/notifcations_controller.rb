class NotificationsController < ApplicationController



  def trigger_alert(speed)
    binding.pry
    @alert_message = "
   This is a test alert.
    Slowing Traffic.
    Average Speed: #{speed}"

    @user_list = YAML.load_file('config/users.yaml')

    begin
      @user_list.each do |user|
        phone_number = user["phone_number"]
        send_message(phone_number, @alert_message)
      end
    end

  end


  def send_message(phone_number, alert_message)

    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    message = @client.account.messages.create(
        :from => @twilio_number,
        :to => phone_number,
        :body => alert_message,
    )
    puts message.to
  end

end


