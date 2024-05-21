class Dmv

  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    
    @matching_facilities = []
    
    # Iterate over each Facility to determine
    # whether or not the passed "service" is
    # included in the list of "facility.services"
    @facilities.find do |facility|

      # Return only "facilities" whether the below
      # condition is true
      if facility.services.include?(service)
        @matching_facilities << facility
      end
    end

    return @matching_facilities
  end
end

# new_dmv = Dmv.new('DMV', '1234 Spruce Lane', '555-555-5555')
# new_dmv.name => 'DMV'
# new_dmv.address => '1234 Spruce Lane'
# new_dmv.phone => '555-555-5555'

# new_dmv_2 = Dmv.new('Other DMV', '4321 Spruce Lane', '123-456-7890')
# new_dmv_2.name => 'Other DMV'
# new_dmv_2.address => '4321 Spruce Lane'
# new_dmv_2.phone => '123-456-7890'