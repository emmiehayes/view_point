class SearchController < ApplicationController

  def index 
    redirect_to root_path unless current_user
    @presenter = MovieSearchPresenter.new(search_params[:search])
  end

  private 

  def search_params
    params.permit(:search)
  end
end

