class SearchesController < ApplicationController
  def show
    @location_results = User.location_search(location_search_user_ids)
  end

  private

  def location_search_user_ids
    User.search_by_location(params[:location_query]).pluck(:id)
  end
end
