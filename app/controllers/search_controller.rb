class SearchController < ApplicationController

  def index 
    redirect_to root_path unless current_user
    @presenter = SearchPresenter.new(search_params)
  end

  private 

  def search_params
    params.permit(:movie, :zipcode, :date)
  end
end

