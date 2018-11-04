class FlagsController < ApplicationController

  def create
    @creator = Creator.new(movie_params,current_user).movie_creator
  end

  private

  def movie_params
    params.permit(:y_id, :title, :trailer)
  end
end
