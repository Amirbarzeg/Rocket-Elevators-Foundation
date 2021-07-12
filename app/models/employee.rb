class Employee < ApplicationRecord 
    belongs_to :user
    has_many :batteries

    #establish_connection :datawarehouse_development
    #self.table_name = "employee"
end
