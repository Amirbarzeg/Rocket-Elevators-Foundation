class Elevator < ApplicationRecord
    belongs_to :column

    before_update :status_send_sms, if: :will_save_change_to_Status?
    before_update :slack_elevator_status, if: :will_save_change_to_Status?
    
    def slack_elevator_status
        notifier = Slack::Notifier.new Figaro.env.slack_hook do
            defaults channel: "#default",
                     username: "notifier"
        end
        notifier.ping "The Elevator #{self.id} with Serial Number #{self.SerialNumber} changed status from #{self.Status_was} to #{self.Status}"
    end

    def status_send_sms()
        require 'rubygems'
        require 'twilio-ruby'
        
        if (self.Status_was != "Intervention" && self.Status == "Intervention")
    
          elevator = self.id  
    
          account_sid = ENV["TWILIO_ACCOUNT_SID"]
          auth_token = ENV["TWILIO_AUTH_TOKEN"]
              
          @client = Twilio::REST::Client.new account_sid, auth_token 
     
          message = @client.messages.create( 
            body: "Elevator id #{self.id} status changed from #{self.Status_was} to \"Technician Intervention Required\"",  
            from: '+14703471818',   
            to: ENV["BUILDING_TECH_PHONE_NUMBER"] 
          ) 
     
          puts message.sid
              
        end
      end
end

