class MoviesController < ApplicationController
  
  def create
    movie = Movie.create(movie_params)
    render json: movie, status: :created
  end

  def index
    movies = Movie.all
    render json: movies, status: :ok
  end

  def update
    movie = Movie.find_by(id: params[:id])
    movie.update(movie.likes + 1)
    render json: movie, status: :accepted
  end


  def destroy
    movie = Movie.find_by(id: params[:id])
    movie.destroy
    head :no_content
  end

private

  def movie_params
    params.permit(:title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director)
  end

end
