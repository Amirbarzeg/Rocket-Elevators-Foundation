class GoogleController < ApplicationController

    #MyApp/app/views/controllers/routers_controller.rb

#Add load_routers and replaced index with the code below
def create  
    @mapp_default = Gmaps4rails.build_markers(Address.all) do |plot, marker|  
       marker.lat plot.latitude  
       marker.lng plot.longitude     

    end  
end
def maps
    return Gmaps4rails.build_markers(Building.all) do |building, marker|
        address1 = Address.find(building.address_id)
        customer1 = Customer.where(id: building.customer_id).first
        buildingDetail1 = BuildingDetail.where(building_id: building.id).first
        
        clientname = customer1.CompanyName
        numoffloors = 0
        numofbatteries = 0
        numofcolumns = 0 
        numofelevators = 0
        fullnameofcontact = building.FullNameOfTheTechContactForTheBuilding

        if buildingDetail1.present? then
            numoffloors = buildingDetail1.Value
        end    
        
        batteries = Battery.where(building_id: building.id)
        batteries.each do |b|
            numofbatteries += 1
            columns = Column.where(battery_id: b.id)
            columns.each do |c|
                numofcolumns += 1
                elevators = Elevator.where(column_id: c.id)
                numofelevators += elevators.count
            end 
        end 

        marker.lat address1.latitude  
        marker.lng address1.longitude



        marker.infowindow render_to_string(:partial => "/google/info", :locals => {
        :numberoffloors => numoffloors,
        :clientname => clientname,
        :numberofbatteries => numofbatteries,
        :numberofcolumns => numofcolumns,
        :numberofelevators => numofelevators,
        :fullnameofcontact => fullnameofcontact

    })
    end    
end     
    def index  
        load_maps  
 
        @maps = Map.all  
    end
end