class MoviesController < ApplicationController
  def index
    @movies = Movie.order_by_average_stars
    @movies = @movies.where("LOWER(actor) ILIKE ?", "%#{params[:actor].downcase}%") if params[:actor].present?
  end

  protected
    def movie_params
      params.require(:movie).permit(
        :title,
        :actor,
        :location,
        :description,
        :director,
        :year,
        :country
      )
    end
end
