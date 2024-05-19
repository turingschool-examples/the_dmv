require 'registrant'

class Facility
  attr_reader :name, :address, :phone, :services
# changed to accept single argument as hash named facility_info
# added .fetch to use for default service value
  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = facility_info.fetch(:services, [])
  end
# add_services changed to add_service 
  def add_service(service)
    @services << service
  end
  # administer_written_test method to update license_data
  def administer_written_test(registrant)
    if @services.include?('Written Test') 
    registrant.license_data[:written] = true
    return true
    else 
    return false
    end
  end
# administer_road_test method to update license_data
  def administer_road_test(registrant)
    if @services.include?('Road Test')
      registrant.license_data[:license] = true
      return true
    else
      return false
    end
  end
# renew_drivers_license method to update license_data
  def renew_drivers_license(registrant)
    if @services.include?('Renew License')
      registrant.license_data[:renewed] = true
      return true
    else
      return false
    end
  end
end
