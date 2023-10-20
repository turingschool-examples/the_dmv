require 'pry'
require './lib/dmv'

class Facility
  attr_reader :name, :address, :phone, :services
  attr_accessor :name, :address, :phone, :services

  def initialize(facil_hash)
    @name = facil_hash[:name]
    @address = facil_hash[:address]
    @phone = facil_hash[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
