require 'facility'
class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end

  def parse_facilities(data)
    data.each do |d|
      d.transform_keys! do |key|
        key_str = key.to_s

        case
        when key_str.include?('dmv_office') || key_str.include?('office_name')
          :name
        when key_str.include?('phone')
          :phone
        when key_str.include?('address__1') # overwriting 'address__1' early prevents bad mod on next line
          :address2
        when key_str.include?('address_')
          :address1
        when key_str.include?('zip')
          :zip
        else
          key
        end
      end

      d[:address] = [d[:address1], d[:address2], d[:city], d[:state], d[:zip]].join(' ')

      @facilities << Facility.new(d)
     end
  end
end
