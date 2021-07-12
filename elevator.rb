class Elevator < ApplicationRecord
  belongs_to :column
  before_update :status_send_sms, if: :will_save_change_to_Status?

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
        to: '+15149967643' 
      ) 
 
      puts message.sid
          
    end
  end

end

# # require 'rubygems'
# require 'twilio-ruby'
# require 'figaro'

# # print a list of all phone calls, what phone number each was to/from, and how
# # much each one cost.

# # put your Twilio credentials here. you can find your AccountSid and AuthToken
# # at the top of your account dashboard page located at:
# #   https://www.twilio.com/user/account
#     account_sid = ENV['Twilio_account_sid']
#     auth_token = ENV['Twilio_auth_token']

# # set up a client
#     @client = Twilio::REST::Client.new(account_sid, auth_token)

#     message = @client.messages.create( 
#       body: 'Elevator status changed to: Technician Intervention Required',  
#       messaging_service_sid: 'MGb517797ec38c950c8d1b8fed41d85bce',      
#       to: ENV['building_tech_phone_number'] 
#     ) 

#     puts message.sid

#   end
# end

# #calls = client.calls.list

# #loop do
# #  calls.each do |call|
# #    price = call.price || '0.00' # since apparently prices can be nil...
# #    puts call.sid + "\t" + call.from + "\t" + call.to + "\t" + price.to_s
# #  end
# #  calls = calls.next_page
# #  break if calls.nil?
# #end