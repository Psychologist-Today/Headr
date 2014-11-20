class SearchesController < ApplicationController
  def show
    @location_results = User.location_search(params[:location_query])
    @name_results = User.name_search(params[:last_name_query])
  end
end
