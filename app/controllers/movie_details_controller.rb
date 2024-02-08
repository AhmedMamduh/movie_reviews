class MovieDetailsController < ApplicationController

  def index
    @movie_details = MovieDetail.order_by_average_stars
    @movie_details = @movie_details.where("LOWER(actor) ILIKE ?", "%#{params[:actor].downcase}%") if params[:actor].present?
  end

end
