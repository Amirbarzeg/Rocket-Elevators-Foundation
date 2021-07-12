class UserNotifierMailer < ApplicationMailer

    default :from => 'nimolimolo@gmail.com'

    # send a confirmation email to the user, pass in the user object that   contains the user's email address
    def send_confirmation_email(lead)
      @lead = lead
      mail( :to => @lead.email,
      :subject => 'Thank you!' )
    end
end
