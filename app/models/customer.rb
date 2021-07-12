class Customer < ApplicationRecord
    belongs_to :user
    belongs_to :address
    has_many :buildings

    after_create :upload_file
    after_update :upload_file

    def upload_file
        puts self.id
        client = DropboxApi::Client.new(ENV["DROPBOX_TOKEN"])

        puts self.EmailOfTheCompany
        Lead.where(Email: self.EmailOfTheCompany).each do |lead|
            unless lead.file.nil?
                puts "This model had blob"
                directory_path = "/" + self.CompanyName
                begin
                    client.create_folder directory_path
                rescue DropboxApi::Errors::FolderConflictError => err 
                    puts "Folder already exists in path"
                end
                begin
                    client.upload(directory_path + "/" + lead.file.filename.sanitized, lead.file.download) 
                rescue DropboxApi::Errors::FileConflictError => err 
                    puts "File already exists in folder"
                end

                lead.file.purge;
                lead.save!
            end
        end   
    end
end