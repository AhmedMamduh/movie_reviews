class MovieDetail < ApplicationRecord
  belongs_to :movie

  scope :order_by_average_stars, -> {
    includes(:movie)
      .joins(movie: :reviews)
      .group('movie_details.id')
      .select('movie_details.*, AVG(reviews.stars) AS average_stars')
      .order('average_stars DESC')
  }
end
