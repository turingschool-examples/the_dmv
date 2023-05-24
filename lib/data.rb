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
            