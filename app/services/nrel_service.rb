class NrelService
  def initialize(filter)
    @filter = filter || {}
    @conn   = Faraday.new(url: "https://developer.nrel.gov/")
  end

  def find_all_stations
    response = conn.get "api/alt-fuel-stations/v1/nearest.json", base_filter.merge(filter)

    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :filter, :conn

  def base_filter
    {
      api_key: ENV['NREL_API_KEY'],
      limit: 10,
      radius: 6.0,
      fuel_type: "ELEC,LPG"
    }
  end
end
