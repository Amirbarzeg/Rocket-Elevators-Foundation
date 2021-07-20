require 'elevator_media'
require 'spec_helper'
require 'rails_helper'
require 'capybara/rspec'

describe ElevatorMedia::Streamer do
    let(:streamer) { ElevatorMedia::Streamer.new }
    let(:car) { ElevatorMedia::Car.new }
    elevator= Elevator.new
    
    describe 'Car' do
       describe 'attributes' do
          it 'allows reading and writing for :make' do
             car.name = 'Test'
             expect(car.name).to eq('Test')
          end
          it 'allows reading and writing for :year' do
             car.year = '2000'
             expect(car.year).to eq('2000')
          end
          it 'allows reading and writing for :color' do
             car.color = 'The Color'
             expect(car.color).to eq('The Color')
          end
         end
     

         describe 'full_name' do
            it 'returns a string in the expected format' do
               @newm = ElevatorMedia::Car.new(:name => 'Audi', :year => 2020, :color => 'green')
               expect(@newm.full_name).to eq('2020 Audi (green)')
            end
            context 'when initialized with no arguments' do
               it 'returns a string using default values' do
                  expect(car.full_name).to eq('2021 Jaguar (red)')
               end
            end
         end
      end
   

      #  Calling from a random API
   
      describe 'joke ' do
         it 'checks if anything is returned' do
            if streamer.getHero != nil
               puts "That's a funny joke"
            else
               puts "There's no joke here"
            end
         end
         it 'returns data correctly' do
            expect(streamer.getHero).to be_kind_of(Hash)
            expect(streamer.getHero).to have_key(:setup)
            expect(streamer.getHero).to have_key(:punchline)
         end
         
      end

      describe 'weather' do
         let(:streamer1) { ElevatorMedia::Streamer.new }
         it 'checks if any weather is returned' do
            if streamer.getweather != nil
            puts "I know"
            else
            puts "wat?"
            end
         end
         it 'returns weather correctly' do
            expect((streamer1.getweather).code).to eq(200)
         end
     end

      describe QuotesController, :type => :controller do

         describe "GET submission from quote controller" do
            it "get submission and return a successful response" do
               get :index
               expect(response).to be_successful
            end
            it "get submission and return 200 status" do
               get :index
               expect(response.status).to eq(200)
            end
         end
      end
      
      describe InterventionsController, type: :controller do
         
         describe 'Test on Differents Scenarios ' do
            it "send a customer_id to the building method and return succesful" do
               building = Building.new(customer_id: 32)
               expect(response).to be_successful
               expect(response.status).to eq(200)
            end
      
            it "send a building_id to the battery method and return succesful" do
               buildingObject = Battery.new(building_id: 20)
               expect(response).to be_successful
               expect(response.status).to eq(200)
            end
            
            it "send a battery_id to the column method and return succesful" do
               building = Column.new(battery_id: 41)
               expect(response).to be_successful
               expect(response.status).to eq(200)
            end
            
            it "send a column_id to the elevator method and return succesful " do
               building = Elevator.new(column_id: 12)
               expect(response).to be_successful
               expect(response.status).to eq(200)
            end
            
            context 'returns error if nothings selected' do
               it 'from battery_id' do
                  intervention = Intervention.new(author_id: 7, customer_id: 1)
                  expect(intervention.battery_id).to eq(nil)
                  expect(intervention).to_not be_valid
               end
         
               it 'from customer_id' do
                  intervention = Intervention.new(author_id: 11, building_id: 11, battery_id: 69, 
                  column_id: 9, elevator_id: 55, employee_id: 7, report: "Random Test")
                  expect(intervention.customer_id).to eq(nil)   
                  expect(intervention).to_not be_valid    
               end
            end
         
            context 'returns true' do
               it 'if all parameters are selected except employee_id ' do
                  intervention = Intervention.new(author_id: 1, customer_id: 51, building_id: 33, battery_id: 33, 
                     column_id: 98 , elevator_id: 390, report: "Another Test"  )
                  expect(intervention.employee_id).to eq(nil)
               end
               
               it 'true if ALL parameters are selected' do
                  intervention = Intervention.new(author_id: 1, customer_id: 4, building_id: 11, battery_id: 11, 
                     column_id: 33, elevator_id: 130, employee_id: 2, report: "all"  )
                  expect(intervention).to be_valid
               end
            end

         end
      end
      
      # describe BatteryController, type: :controller do
      #    describe 'gets the number and' do
      #       it 'querys all elevators' do
      #          expect(BatteryController).to receive(:all){[]}
      #          ElevatorMedia::Streamer.getAllBatteries
      #        end
      #     end
     
    
      describe "Contact US", type: :features do
         it "Fill " do
            visit '/index#contact'
            within("#new_lead") do
               fill_in "lead_FullName", with: "Jack"
               fill_in "lead_CompanyName", with: "opiuyr" 
               fill_in "lead_email", with: "ba@hfj.com"
               fill_in "lead_Phone", with: "Jack" 
               fill_in "lead_ProjectName", with: "Jackui"
               fill_in "lead_ProjectDescription", with: "Jackkopiu"
               fill_in "lead_Message",	with: "jdhfohfifk"
         end
         click_button "SEND MESSAGE"
         expect(page).to have_current_path '/index'
         p page 
         end
      end
   end

