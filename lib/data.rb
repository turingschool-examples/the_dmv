require 'json'
class Data
    def initialize
        @facilities = []
        @vehicles =[]
    end

    def create_facility(facility_list)
    
        facility_list.each do|facility|
            keys =  facility.keys

            keys.each do |key|
                if key.to_s.include?('address') ||  key.to_s.include?('location') 
                        if facility.has_key?(:location_1) ==true 
                            hash = JSON.parse(facility.dig(:location_1, :human_address))
                            facility.update({:address => hash.fetch("address")})
                        else
                            facility.update({:address => facility.fetch(key)})
                        end 
                elsif   key.to_s.include?('title') ||  key.to_s.include?('name') 