class SearchController < ApplicationController
  def index
    @stations = FuelStationSearchPresenter.new(location: params[:q]).stations
  end
end

