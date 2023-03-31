class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(params)
    @name = params[:name]
    @address = params[:address]
    @phone = params[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
