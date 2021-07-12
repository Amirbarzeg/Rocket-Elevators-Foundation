class Quote < ApplicationRecord
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
        
        buildingType = self.BuildingType
        nbFloors = self.NumberOfFloors
        nbBase = self.NumberOfBasements
        nbCom = self.NumberOfcompanies
        nbSpots = self.NumberOfParkingSpots
        nbEle = self.NumberOfElevators
        nbApart = self.NumberOfApartments
        nbCorp = self.NumberOfCorporations
        nbOcc = self.NumberOfOccupany
        nbBusi = self.NumberOfBusinessHours
        eleAmount = self.ElevatorAmount
        colAmount = self.ColumnAmount
        prodLine = self.ProductLine
        unitCost = self.ElevatorUnitCost
        eleTotalCost = self.ElevatorTotalCost
        installCost = self.InstallationCost
        totalPrice = self.TotalPrice
        companyName = self.CompanyName
        email = self.Email

        if companyName == nil 
            companyName = "unknown"
        end

        if email == nil
            email = "unknown"
        end

        ZendeskAPI::Ticket.create!(client, :subject => "#{email} from #{companyName}", :comment => { :value => "The contact from company #{companyName} can be reached at email  #{email}.\n Quote :\nBuilding Type : #{buildingType}\nNumber of Floors : #{nbFloors}\nNumber of Basements : #{nbBase}\nNumber of Companies : #{nbCom}\nNumber of Parking Spots : #{nbSpots}\nNumber of Elevators : #{nbEle}\nNumber of Apartments : #{nbApart}\nNumber of Corporations : #{nbCorp}\nOccupancy : #{nbOcc}\nNumber of Business Hours : #{nbBusi}\nElevator Amount : #{eleAmount}\nColumn Amount : #{colAmount}\nProduction Line : #{prodLine}\nUnit Cost : #{unitCost}\nElevator Total Cost : #{eleTotalCost}\nInstallation Cost : #{installCost}\nTotal Price : #{totalPrice}\n
        "}, :type => "task")
    end
end
