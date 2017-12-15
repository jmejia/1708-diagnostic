class FuelStationSearchPresenter
  def initialize(filter = {})
    @filter = filter
  end

  def stations
    service.find_all_stations[:fuel_stations].map do |raw_station|
      FuelStation.new(raw_station)
    end
  end

  private
  attr_reader :filter

  def service
    NrelService.new(filter)
  end
end
