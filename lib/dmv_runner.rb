require_relative 'stats'
require_relative 'dmv_data_service'
require_relative 'dmv'
require_relative 'facility'
require_relative 'vehicle'
require_relative 'vehicle_factory'
require_relative 'dmv_factory'

on = true

def grab_dmv_co
  dmv_factory = DmvFactory.new
  facilities = []
  co_dmv_office_locations = dmv_factory.create_facilities(DmvDataService.new.co_dmv_office_locations)
  co_dmv_office_locations.each do |location|
    facilities << location.facility_info
  end
  facilities
end

def grab_dmv_ny
  dmv_factory = DmvFactory.new
  facilities = []
  ny_dmv_office_locations = dmv_factory.create_facilities(DmvDataService.new.ny_dmv_office_locations)
  ny_dmv_office_locations.each do |location|
    facilities << location.facility_info
  end
  facilities
end

def grab_dmv_mo
  dmv_factory = DmvFactory.new
  facilities = []
  mo_dmv_office_locations = dmv_factory.create_facilities(DmvDataService.new.mo_dmv_office_locations)
  mo_dmv_office_locations.each do |location|
    facilities << location.facility_info
  end
  facilities
end

while on do
  puts "What would you like to do?:"
  puts "-see available dmv facilities(type 'dmv')"
  puts "-get ev registration stats from WA(type 'stats')"
  puts "-off to quit"
  choice = gets.chomp

  if choice == 'dmv'
    puts "what state do you want to view?: ('CO', 'NY', 'MO')"
    state = gets.chomp
    if state == 'CO'
      puts grab_dmv_co
    elsif state == 'NY'
      puts grab_dmv_ny
    elsif state == 'MO'
      puts grab_dmv_mo
    end
  elsif choice == 'stats'
    puts "what would you like to see?"
    puts "-Most popular make and model?(type 'top model')"
    puts "-Total EV registrations by year?(type 'yearly')"
    puts "-County with highest EV registrations?(type 'county')"
    choice = gets.chomp
    if choice == 'top model'
      puts Stats.new.most_popular_make_model
    elsif choice == 'yearly'
      puts Stats.new.vehicles_registered_by_year
    elsif choice == 'county'
      puts Stats.new.most_registrations_by_county
    end
  elsif choice == 'off'
    on = false
  end
end


