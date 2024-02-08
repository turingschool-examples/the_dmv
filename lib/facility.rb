class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(branch_info)
    @name = branch_info[:name]
    @address = branch_info[:address]
    @phone = branch_info[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
