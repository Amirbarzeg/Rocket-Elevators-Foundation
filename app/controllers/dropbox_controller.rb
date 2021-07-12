class DropboxController < ApplicationController
    client = DropboxApi::Client.new("xY3hz8wbkbQAAAAAAAAAAT0A3w4L9017xRMq-JOp265MLqeBf_k18lYSaRM3qrLD")


    def createfolder
        client.create_folder "/Luka Gasic/Apps/Rocket Elevators Digital Presence/testing"
    end

end
