require 'json'
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"

class WatsonController < ApplicationController
    include IBMWatson

    skip_before_action :verify_authenticity_token
    def watsonBriefing
        require 'figaro'
        email = current_user.email
                
        sql = "SELECT count(id) FROM elevators"
        sqlElevators = ActiveRecord::Base.connection.execute(sql)

        sql = "SELECT count(id) FROM buildings"
        sqlBuildings = ActiveRecord::Base.connection.execute(sql)

        sql = "SELECT count(id) FROM customers"
        sqlCustomers = ActiveRecord::Base.connection.execute(sql)

        sql = "SELECT count(id) FROM elevators WHERE elevators.status != 'Running'"
        sqlNotRunningEle = ActiveRecord::Base.connection.execute(sql)

        sql = "SELECT count(id) FROM quotes"
        sqlQuotes = ActiveRecord::Base.connection.execute(sql)

        sql = "SELECT count(id) FROM leads"
        sqlLeads = ActiveRecord::Base.connection.execute(sql)

        sql = "SELECT count(id) FROM batteries"
        sqlBatteries = ActiveRecord::Base.connection.execute(sql)

        sql = "SELECT count(id) FROM addresses WHERE addresses.entity = 'building'"
        sqlAdresses = ActiveRecord::Base.connection.execute(sql)

        text = "Greetings #{email}. There are currently #{sqlElevators.first.first} elevators deployed in the #{sqlBuildings.first.first} buildings of your #{sqlCustomers.first.first} customers. Currently, #{sqlNotRunningEle.first.first} elevators are not in Running Status and are being serviced. You currently have #{sqlQuotes.first.first} quotes awaiting processing. You currently have #{sqlLeads.first.first} leads in your contact requests. #{sqlBatteries.first.first} Batteries are deployed across #{sqlAdresses.first.first} cities."
        
        foo = {
            'email' => email,
            'sqlElevators' => sqlElevators,
            'sqlBuildings' => sqlBuildings,
            'sqlCustomers' => sqlCustomers,
            'sqlNotRunningEle' => sqlNotRunningEle,
            'sqlQuotes' => sqlQuotes,
            'sqlLeads' => sqlLeads,
            'sqlBatteries' => sqlBatteries,
            'sqlAdresses' => sqlAdresses,
            'text' => text
        }
        
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
        apikey: ENV["WATSON_KEY"]
        )

        text_to_speech = IBMWatson::TextToSpeechV1.new(
        authenticator: authenticator
        )
        text_to_speech.service_url = Figaro.env.watson_url
        

        # NEED TO PUT text VARIABLE INSTEAD OF "Nouveau message"
        File.open("public/demo.mp3", "wb") do |audio_file|
            response = text_to_speech.synthesize(
                text: text,
                accept: "audio/mp3",
                voice: "en-US_AllisonV3Voice"
            )
            audio_file.write(response.result)
        end

        render json: foo
    end
end
