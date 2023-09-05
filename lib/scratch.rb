require './spec/spec_helper'

ny_dds = DmvDataService.new.ny_dmv_office_locations
ny_facilities = FacilityFactory.new.create_facilities(DmvDataService.new.ny_dmv_office_locations)

def get_branch_hours
  branch_hours_all = []
  ny_dds = DmvDataService.new.ny_dmv_office_locations
  ny_dds.map do |facility|
    branch_arr = []
    facility.each do |key, val|
      if key.to_s.include?('hours')
        branch_arr.push(facility[key])
      end
    end
    branch_hours_all << branch_arr
  end
  branch_hours_all
end

require 'pry'; binding.pry
  # if facility.keys.include?('hours')
  #   facility[key]
  # end

