class Address < ApplicationRecord
    has_many :customers
    has_many :buildings
    geocoded_by :address
    after_validation :geocode
    def address
      [self.NumberAndStreet,self.City,self.Country].compact.join(", ")
    end 
    
end
