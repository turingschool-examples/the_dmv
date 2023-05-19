class Facility
  attr_reader :address,
              :collected_fees,
              :name,
              :phone,
              :registered_vehicles, 
              :services

  def initialize(contact_info)
    @contact_info = contact_info
    @address = contact_info.fetch(:address)
    @collected_fees = 0
    @name = contact_info.fetch(:name)
    @phone = contact_info.fetch(:phone)
    @registered_vehicles = []
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
