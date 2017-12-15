require 'rails_helper'

describe FuelStation do
  context ".new(attrs)" do
    it "exists with valid attributes" do
      valid_attrs = {
        :access_days_time=>"24 hours daily",
        :fuel_type_code=>"ELEC",
        :station_name=>"Gary's Gas",
        :city=>"Denver",
        :state=>"CO",
        :street_address=>"800 Acoma St",
        :zip=>"80204",
        :distance=>0.31422
      }

      station = FuelStation.new(valid_attrs)

      expect(station).to be_a FuelStation
      expect(station.name).to eq("Gary's Gas")
      expect(station.address).to eq("800 Acoma St, Denver, CO 80204")
      expect(station.fuel_types).to eq("ELEC")
      expect(station.distance).to eq(0.31422)
      expect(station.access_times).to eq("24 hours daily")
    end
  end
end
