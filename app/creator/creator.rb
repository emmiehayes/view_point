class Creator 

  def initialize(movie_params, current_user)
    @user = current_user
    @movie_params = movie_params
    @movie = ''
  end

  def movie_creator
     @movie = Movie.find_or_create_by(y_id: movie_params[:y_id]) do |movie|
      movie.title = movie_params[:title]
      movie.trailer_url = movie_params[:trailer]
    end
    flag_creator
  end
  
  private 
  attr_reader :movie_params, :user, :movie

  def flag_creator
    Flag.create(user_id: user.id, movie_id: movie.id)
  end
end
