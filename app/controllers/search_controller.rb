class SearchController < ApplicationController
  
  def index 
    @presenter = MovieSearchPresenter.new(search_params[:search])
  end

  private 

  def search_params
    params.permit(:search)
  end
end
