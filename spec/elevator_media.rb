require 'uri'
require 'net/http'
require 'openssl'
require 'httparty'
module ElevatorMedia

    class Car
       attr_accessor :name, :year, :color
       attr_writer :doors
 
       def initialize(options = {})
          self.name = options[:name] || 'Jaguar'
          self.year = (options[:year] || 2021).to_i
          self.color = options[:color] || 'red'
       end
 
       def self.colors
          ['black', 'red', 'blue', 'yellow']
       end
 
       def full_name
          "#{self.year.to_s} #{self.name} (#{self.color})"
       end
 
    end
    
    class Streamer
      attr_accessor :response1
      attr_accessor :battery_id
       def initialize
          @superherostats = 'http://official-joke-api.appspot.com/random_joke'
          @weather= "https://www.7timer.info/bin/civil.php?lon=-73.6&lat=45.5&ac=0&unit=metric&output=json&tzshift=0"
       end
       def getContent
          # obj = JSON.parse(self.getJoke)['setup']
          obj = getHero
          obj1=getweather
          html = '<div class="rocket-tdd">#{obj, obj1}</div>'
          return html
       end
 
       def getHero
         url = 'http://official-joke-api.appspot.com/random_joke'
          data = Faraday.get(url).body
          JSON.parse(data, symbolize_names: true)
       end
       def getweather
            response1 = HTTParty.get('https://www.7timer.info/bin/civil.php?lon=-73.6&lat=45.5&ac=0&unit=metric&output=json&tzshift=0')
       end
 
       def heroIndex
          render json: {success: true}
        end

        def self.getAllBatteries
            Battery.all.each do |battery|
            battery_id = [battery.id]
         end
      end
    end
 end
 