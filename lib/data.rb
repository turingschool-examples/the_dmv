require 'json'
class Data
    def initialize
        @facilities = []
        @vehicles =[]
    end

    def create_facility(facility_list)
    
        facility_list.each do|facility|
            keys =  facility.keys
            