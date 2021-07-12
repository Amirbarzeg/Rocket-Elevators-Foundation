class Lead < ApplicationRecord

    # after_create :send_zendesk

    def send_zendesk
        require 'zendesk_api'
        require 'figaro'
        
        client = ZendeskAPI::Client.new do |config|
        # Mandatory:

            config.url = ENV["ZENDESK_URL"] # e.g. https://yoursubdomain.zendesk.com/api/v2
            # Basic / Token Authentication
            config.username = ENV["ZENDESK_EMAIL"]
            # Choose one of the following depending on your authentication choice
            config.password = ENV["ZENDESK_PASSWORD"]

            config.retry = true

            # Logger prints to STDERR by default, to e.g. print to stdout:
            require 'logger'
            config.logger = Logger.new(STDOUT)
        end

        fullName = self.FullName
        companyName = self.CompanyName
        email = self.email
        phone = self.Phone
        department = self.Departement
        projectName = self.ProjectName
        projectDescription = self.ProjectDescription
        attachedMessage = self.Message

        ZendeskAPI::Ticket.create!(client, :subject => "#{fullName} from #{companyName}", :comment => { :value => "The contact #{fullName} from company #{companyName} can be reached at email  #{email} and at phone number #{phone}. #{department} has a project named #{projectName} which would require contribution from Rocket Elevators.\n#{projectDescription}\nAttached Message :\n#{attachedMessage}\nThe Contact uploaded an attachment" }, :type => "question")
        
    end

    has_one_attached :file

end
